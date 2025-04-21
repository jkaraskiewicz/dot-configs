-- LSP servers manager

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  print('mason not found')
  return
end

mason.setup()
