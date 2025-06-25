local M = {}
local H = {}

M.window_config = function(rows)
  local height = rows or math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

M.vcs_commits = function(local_opts, opts)
  local mini_pick = H.mini_pick()
  local_opts = vim.tbl_deep_extend('force', { vcs = 'git' }, local_opts or {})

  local vcs_tool = local_opts.vcs

  local command
  local repo_dir

  if vcs_tool == 'git' then
    command = { 'git', 'log', '--graph', '--all', '--abbrev-commit',
      '--pretty=format:%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %Creset' }
    repo_dir = H.get_git_repository()
  elseif vcs_tool == 'hg' then
    command = { 'hg', 'log', '--template', '\'{onelinesummary}\n\'' }
    repo_dir = H.get_hg_repository()
  else
    error('VCS type not supported')
  end

  local preview = function(buf_id, item)
    local result
    local commit_id

    if vcs_tool == 'git' then
      commit_id = H.extract_git_rev(item)
      result = vim.fn.systemlist('git show ' .. commit_id)
    elseif vcs_tool == 'hg' then
      commit_id = H.extract_hg_rev(item)
      result = vim.fn.systemlist('hg log --stat -r ' .. commit_id)
    end

    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, result)
  end

  local choose_marked = function(items_marked)
    local len = table.getn(items_marked)
    if len < 1 or len > 2 then return {} end

    local first_rev = H.extract_rev(vcs_tool, items_marked[1])
    local second_rev = H.extract_rev(vcs_tool, items_marked[2])

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
  return mini_pick.builtin.cli({ command = command }, opts)
end

H.open_diffview = vim.schedule_wrap(function(first_rev, second_rev)
  local command
  if second_rev ~= nil then
    command = 'DiffviewOpen "' .. first_rev .. '" "' .. second_rev .. '"'
  else
    command = 'DiffviewOpen "' .. first_rev .. '"'
  end
  vim.cmd(command)
end)

H.mini_pick = function()
  return require('mini.pick')
end

H.extract_rev = function(vcs, item)
  if item == nil then return nil end
  if vcs == 'git' then
    return H.extract_git_rev(item)
  elseif vcs == 'hg' then
    return H.extract_hg_rev(item)
  end
end

H.extract_git_rev = function(item)
  return string.match(item, '%w%w%w%w%w%w%w')
end

H.extract_hg_rev = function(item)
  return string.match(item, '%w%w%w%w%w%w%w%w')
end

H.get_git_repository = function()
  local repo_dir = vim.fn.systemlist({ 'git', '-C', '.', 'rev-parse', '--show-toplevel' })[1]
  if vim.v.shell_error ~= 0 then
    error('Could not find a git repository for current path')
  end
  return repo_dir
end

H.get_hg_repository = function()
  local repo_dir = vim.fn.systemlist({ 'hg', 'root' })[1]
  if vim.v.shell_error ~= 0 then
    error('Could not find a git repository for current path')
  end
  return repo_dir
end

return M
