-- Handles sessions (remembers open files, lines, etc.)

local status_ok, mini_sessions = pcall(require, 'mini.sessions')
if not status_ok then
  print('mini.sessions not found')
  return
end

mini_sessions.setup({
  autowrite = true,
  force = { read = false, write = true, delete = true },
  hooks = {
    post = {
      read = function()
        vim.cmd('Neotree show')
      end,
    },
  },
})

vim.keymap.set('n', '<leader>Sw', function()
  local cwd = vim.fn.getcwd()
  local last_dir = cwd:match('([^/]+)$')
  require('mini.sessions').write(last_dir)
end, {
  noremap = true,
  silent = true,
  desc = 'Save session',
})

vim.keymap.set('n', '<leader>Sl', function()
  vim.cmd('wa')
  require('mini.sessions').select()
end, {
  noremap = true,
  silent = true,
  desc = 'Load session',
})

vim.keymap.set('n', '<leader>Sd', function()
  require('mini.sessions').delete()
end, {
  noremap = true,
  silent = true,
  desc = 'Delete session',
})

vim.keymap.set('n', '<leader>Ss', function()
  vim.cmd('wa')
  require('mini.sessions').write()
  require('mini.sessions').select()
end, {
  noremap = true,
  silent = true,
  desc = 'Switch session',
})
