-- Status line from mini.nvim

local status_ok, mini_statusline = pcall(require, 'mini.statusline')
if not status_ok then
  print('mini.statusline not found')
  return
end

mini_statusline.setup()
