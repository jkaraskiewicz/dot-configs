local M = {}
local H = {}

-- VCS configurations
local vcs_configs = {
  git = {
    get_repo_dir = function()
      local repo_dir = vim.fn.systemlist({ 'git', '-C', '.', 'rev-parse', '--show-toplevel' })[1]
      if vim.v.shell_error ~= 0 then
        error('Could not find a git repository for current path')
      end
      return repo_dir
    end,
    list_command = { 'git', 'log', '--graph', '--all', '--abbrev-commit',
      '--pretty=format:%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %Creset' },
    preview_command = function(commit_id)
      return vim.fn.systemlist('git show ' .. commit_id)
    end,
    extract_rev = function(item)
      return string.match(item, '%w%w%w%w%w%w%w')
    end,
    postprocess = function(items)
      return items
    end,
  },
  hg = {
    get_repo_dir = function()
      local repo_dir = vim.fn.systemlist({ 'hg', 'root' })[1]
      if vim.v.shell_error ~= 0 then
        error('Could not find a hg repository for current path')
      end
      return repo_dir
    end,
    list_command = { 'hg', 'tree', '--reverse', '--compact' },
    preview_command = function(commit_id)
      return vim.fn.systemlist('hg log --stat -r ' .. commit_id)
    end,
    extract_rev = function(item)
      return string.match(item, '%w%w%w%w%w%w%w%w')
    end,
    postprocess = function(items)
      local result = {}
      local current = ''
      for _, item in ipairs(items) do
        if string.find(item, '^[^%w]*[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]?%s') then
          if current ~= '' then table.insert(result, current) end
          current = item
        else
          current = current .. string.gsub(item, '[^%w]*(.+)', ' %1')
        end
      end
      if current ~= '' then table.insert(result, current) end
      return result
    end,
  },
}

M.vcs_commits = function(local_opts, opts)
  local mini_pick = H.mini_pick()
  local_opts = local_opts or {}
  if local_opts.vcs == nil then
    local_opts.vcs = { 'git', 'hg' }    -- Default priority list
  elseif type(local_opts.vcs) == 'string' then
    local_opts.vcs = { local_opts.vcs } -- Wrap single string in a table
  end

  local vcs_tool, repo_dir = H.determine_vcs(local_opts.vcs)

  if not vcs_tool then
    error('No supported VCS found in the current directory for the priority list: ' .. table.concat(local_opts.vcs, ', '))
  end

  local vcs_config = vcs_configs[vcs_tool]

  local preview = function(buf_id, item)
    local commit_id = vcs_config.extract_rev(item)
    if commit_id then
      local result = vcs_config.preview_command(commit_id)
      vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, result)
    end
  end

  local choose_marked = function(items_marked)
    if #items_marked < 1 or #items_marked > 2 then return {} end

    local first_rev = vcs_config.extract_rev(items_marked[1])
    local second_rev
    if items_marked[2] then
      second_rev = vcs_config.extract_rev(items_marked[2])
    end

    H.open_diffview(first_rev, second_rev)

    return false
  end

  local default_source = {
    name = 'VCS commits',
    cwd = repo_dir,
    preview = preview,
    choose_marked = choose_marked,
  }

  opts = vim.tbl_deep_extend('force', { source = default_source }, opts or {})
  return mini_pick.builtin.cli(
    { command = vcs_config.list_command, postprocess = vcs_config.postprocess },
    opts
  )
end

H.determine_vcs = function(vcs_priority_list)
  for _, vcs_name in ipairs(vcs_priority_list) do
    local vcs_config = vcs_configs[vcs_name]
    if vcs_config then
      local success, repo_dir = pcall(vcs_config.get_repo_dir)
      if success and repo_dir then
        return vcs_name, repo_dir
      end
    end
  end
end

H.open_diffview = vim.schedule_wrap(function(first_rev, second_rev)
  local command
  if second_rev then
    command = 'DiffviewOpen "' .. first_rev .. '..' .. second_rev .. '"'
  else
    command = 'DiffviewOpen "' .. first_rev .. '"'
  end
  print(command)
  vim.cmd(command)
end)

H.mini_pick = function()
  return require('mini.pick')
end

return M
