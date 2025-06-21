local M = {}

M.hg_cache = {}

function M.setup()
  local diff = require('mini.diff')

  diff.gen_source.mercurial = function()
    local attach = function(buf_id)
      -- Try attaching to a buffer only once
      if M.hg_cache[buf_id] ~= nil then return false end
      -- Resolve symlinks to get data from the original repo
      local path = M.get_buf_realpath(buf_id)
      if path == '' then return false end

      M.hg_cache[buf_id] = {}
      M.hg_start_watching_dirstate(buf_id, path)
    end

    local detach = function(buf_id)
      local cache = M.hg_cache[buf_id]
      M.hg_cache[buf_id] = nil
      M.hg_invalidate_cache(cache)
    end

    return { name = 'mercurial', attach = attach, detach = detach }
  end
end

-- Helper functions
M.get_buf_realpath = function(buf_id)
  return vim.loop.fs_realpath(vim.api.nvim_buf_get_name(buf_id)) or ''
end

M.read_stream = function(stream, feed)
  local callback = function(err, data)
    if data ~= nil then return table.insert(feed, data) end
    if err then feed[1] = nil end
    stream:close()
  end
  stream:read_start(callback)
end

M.hg_start_watching_dirstate = function(buf_id, path)
    local diff = require('mini.diff')

  -- Watch the `.hg` directory for changes to the `dirstate` file.
  local stdout = vim.loop.new_pipe()
  local args = { 'root' }
  local spawn_opts = { args = args, cwd = vim.fn.fnamemodify(path, ':h'), stdio = { nil, stdout, nil } }

  local on_not_in_hg = vim.schedule_wrap(function()
    if not vim.api.nvim_buf_is_valid(buf_id) then
      M.cache[buf_id] = nil
      return
    end
    diff.fail_attach(buf_id)
    M.hg_cache[buf_id] = {}
  end)

  local process, stdout_feed = nil, {}
  local on_exit = function(exit_code)
    process:close()

    if exit_code ~= 0 or stdout_feed[1] == nil then return on_not_in_hg() end

    local hg_root_path = table.concat(stdout_feed, ''):gsub('\n+$', '')
    local hg_dir_path = hg_root_path .. '/.hg'
    M.hg_setup_dirstate_watch(buf_id, hg_dir_path)

    -- Set reference text immediately
    M.hg_set_ref_text(buf_id)
  end

  process = vim.loop.spawn('hg', spawn_opts, on_exit)
  M.read_stream(stdout, stdout_feed)
end

M.hg_setup_dirstate_watch = function(buf_id, hg_dir_path)
  local buf_fs_event, timer = vim.loop.new_fs_event(), vim.loop.new_timer()
  local buf_hg_set_ref_text = function() M.hg_set_ref_text(buf_id) end

  local watch_dirstate = function(_, filename, _)
    if filename ~= 'dirstate' then return end
    timer:stop()
    timer:start(50, 0, buf_hg_set_ref_text)
  end
  buf_fs_event:start(hg_dir_path, { recursive = false }, watch_dirstate)

  M.hg_invalidate_cache(M.hg_cache[buf_id])
  M.hg_cache[buf_id] = { fs_event = buf_fs_event, timer = timer }
end

M.hg_invalidate_cache = function(cache)
  if cache == nil then return end
  pcall(vim.loop.fs_event_stop, cache.fs_event)
  pcall(vim.loop.timer_stop, cache.timer)
end

M.hg_set_ref_text = vim.schedule_wrap(function(buf_id)
  local diff = require('mini.diff')

  if not vim.api.nvim_buf_is_valid(buf_id) then return end
  local buf_set_ref_text = vim.schedule_wrap(function(text) pcall(diff.set_ref_text, buf_id, text) end)

  local path = M.get_buf_realpath(buf_id)
  if path == '' then return buf_set_ref_text({}) end
  local cwd, basename = vim.fn.fnamemodify(path, ':h'), vim.fn.fnamemodify(path, ':t')

  local stdout = vim.loop.new_pipe()
  -- Use `hg cat -r . <file>` to get content of parent revision
  local spawn_opts = { args = { 'cat', '-r', '.', basename }, cwd = cwd, stdio = { nil, stdout, nil } }

  local process, stdout_feed = nil, {}
  local on_exit = function(exit_code)
    process:close()
    if exit_code ~= 0 or stdout_feed[1] == nil then return buf_set_ref_text({}) end

    local text = table.concat(stdout_feed, ''):gsub('\r\n', '\n')
    buf_set_ref_text(text)
  end

  process = vim.loop.spawn('hg', spawn_opts, on_exit)
  M.read_stream(stdout, stdout_feed)
end)

return M

