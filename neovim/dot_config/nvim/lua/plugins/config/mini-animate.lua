-- Animate scrolling etc.

local status_ok, mini_animate = pcall(require, 'mini.animate')
if not status_ok then
  print('mini.animate not found')
  return
end

mini_animate.setup({
  scroll = {
    enable = true,
    timing = mini_animate.gen_timing.linear({ duration = 100, unit = 'total' }),
  },
  cursor = {
    enable = true,
    timing = mini_animate.gen_timing.linear({ duration = 200, unit = 'total' }),
  },
  resize = {
    enable = false,
  },
  open = {
    enable = false,
  },
  close = {
    enable = false,
  },
})
