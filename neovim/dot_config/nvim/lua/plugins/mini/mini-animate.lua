return {
  'echasnovski/mini.animate',
  version = false,
  config = function()
    require('mini.animate').setup({
      scroll = {
        enable = false,
      },
      cursor = {
        enable = true,
        timing = require('mini.animate').gen_timing.cubic({ duration = 50, unit = 'total' }),
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
  end,
}
