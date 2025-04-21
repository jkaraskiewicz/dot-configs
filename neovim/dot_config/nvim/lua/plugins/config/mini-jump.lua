-- Extended f, F, t, T motions

local status_ok, mini_jump = pcall(require, 'mini.jump')
if not status_ok then
  print('mini.jump not found')
  return
end

mini_jump.setup()
