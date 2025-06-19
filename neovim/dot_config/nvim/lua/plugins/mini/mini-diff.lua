return {
  'echasnovski/mini.diff',
  version = false,
  init = function()
    local mini_diff = require('mini.diff')
    mini_diff.setup({
      view = {
        style = 'sign',
        signs = { add = '+', change = '~', delete = '-' },
        priority = 1000,
      },
      source = { mini_diff.gen_source.git(), mini_diff.gen_source.save() },
    })
  end,
}
