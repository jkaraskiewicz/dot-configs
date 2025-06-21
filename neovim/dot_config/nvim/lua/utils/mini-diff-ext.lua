local M = {}

M.hg_cache = {}
M.jj_cache = {}

-- Common
local function get_buf_realpath(buf_id)
  return vim.loop.fs_realpath(vim.api.nvim_buf_get_name(buf_id)) or ''
end

local function invalidate_cache(cache, buf_id)
  local cache_entry = cache[buf_id]
  if cache_entry == nil then return false end
  pcall(function()
    cache_entry.fs_event:stop()
    cache_entry.timer:stop()
  end)
  cache[buf_id] = nil -- Is this correct?
end

local function read_stream(stream, feed)
  local callback = function(err, data)
    if data ~= nil then return table.insert(feed, data) end
    if err then feed[1] = nil end
    stream:close()
  end
  stream:read_start(callback)
end

-- Hg

local hg_set_ref_text = vim.schedule_wrap(function(buf_id)
  local diff = require('mini.diff')

  if not vim.api.nvim_buf_is_valid(buf_id) then return end
  local buf_set_ref_text = vim.schedule_wrap(function(text) pcall(diff.set_ref_text, buf_id, text) end)

  local path = get_buf_realpath(buf_id)
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
  read_stream(stdout, stdout_feed)
end)

local function hg_setup_dirstate_watch(buf_id, hg_dir_path)
  local buf_fs_event, timer = vim.loop.new_fs_event(), vim.loop.new_timer()
  local buf_hg_set_ref_text = function() hg_set_ref_text(buf_id) end

  local watch_dirstate = function(_, filename, _)
    if filename ~= 'dirstate' then return end
    timer:stop()
    timer:start(50, 0, buf_hg_set_ref_text)
  end
  buf_fs_event:start(hg_dir_path, { recursive = false }, watch_dirstate)

  invalidate_cache(M.hg_cache, buf_id)
  M.hg_cache[buf_id] = { fs_event = buf_fs_event, timer = timer }
end

local function hg_start_watching_dirstate(buf_id, path)
  local diff = require('mini.diff')

  -- Watch the `.hg` directory for changes to the `dirstate` file.
  local stdout = vim.loop.new_pipe()
  local args = { 'root' }
  local spawn_opts = { args = args, cwd = vim.fn.fnamemodify(path, ':h'), stdio = { nil, stdout, nil } }

  local on_not_in_hg = vim.schedule_wrap(function()
    if not vim.api.nvim_buf_is_valid(buf_id) then
      M.hg_cache[buf_id] = nil
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
    hg_setup_dirstate_watch(buf_id, hg_dir_path)

    -- Set reference text immediately
    hg_set_ref_text(buf_id)
  end

  process = vim.loop.spawn('hg', spawn_opts, on_exit)
  read_stream(stdout, stdout_feed)
end

-- Jujutsu

local function jj_get_repository_dir(path)
  local result = vim.system({ 'jj', '--ignore-working-copy', 'root' }, { cwd = vim.fs.dirname(path) }):wait()
  if result.code == 0 then
    return vim.trim(result.stdout)
  else
    return nil
  end
end

local function jj_start_watching_dirstate(buf_id, path)
  local repository = jj_get_repository_dir(path)
  if repository == nil then return false end
  local watchfile = vim.fs.joinpath(repo, '.jj/working_copy')

  local buf_fs_event, timer = vim.loop.new_fs_event(), vim.loop.new_timer()
  local set_ref_text = function()
    vim.system(
      { 'jj', '--ignore-working-copy', 'file', 'show', '-r', '@-', '\"' .. path .. '\"' },
      { cwd = vim.fs.dirname(path), text = true },
      vim.schedule_wrap(function(res)
        local MiniDiff = require('mini.diff')
        MiniDiff.set_ref_text(buf_id, res.stdout)
      end)
    )
  end

  local watch_index = function(_, filename, _)
    if filename ~= 'checkout' then return end
    timer:stop()
    timer:start(50, 0, set_ref_text)
  end
  buf_fs_event:start(watchfile, { recursive = true }, watch_index)

  invalidate_cache(buf_id)
  cache[buf_id] = { fs_event = buf_fs_event, timer = timer }

  set_ref_text()
end

function M.setup()
  local diff = require('mini.diff')

  diff.gen_source.mercurial = function()
    local attach = function(buf_id)
      -- Try attaching to a buffer only once
      if M.hg_cache[buf_id] ~= nil then return false end
      -- Resolve symlinks to get data from the original repo
      local path = get_buf_realpath(buf_id)
      if path == '' then return false end

      M.hg_cache[buf_id] = {}
      hg_start_watching_dirstate(buf_id, path)
    end

    local detach = function(buf_id)
      invalidate_cache(M.hg_cache, buf_id)
    end

    return { name = 'mercurial', attach = attach, detach = detach }
  end

  diff.gen_source.jj = function()
    local attach = function(buf_id)
      if M.jj_cache[buf_id] ~= nil then return false end

      local path = get_buf_realpath(buf_id)
      if path == '' then return false end

      return jj_start_watching_dirstate(buf_id, path)
    end

    local detach = function(buf_id)
      invalidate_cache(M.jj_cache, buf_id)
    end

    return { name = 'jj', attach = attach, detach = detach }
  end
end

return M
