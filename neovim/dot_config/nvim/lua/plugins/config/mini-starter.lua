-- Display a starter view after entering nvim

local status_ok, mini_starter = pcall(require, 'mini.starter')
if not status_ok then
  print('mini.starter not found')
  return
end

mini_starter.setup()
