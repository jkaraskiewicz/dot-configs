-- Defines global and local bookmarks/jump-points

local status_ok, arrow = pcall(require, 'arrow')
if not status_ok then
  print('arrow not found')
  return
end

arrow.setup({
  show_icons = true,
  leader_key = '[',
  buffer_leader_key = ']',
})
