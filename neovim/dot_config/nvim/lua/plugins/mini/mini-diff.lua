return {
  'echasnovski/mini.diff',
  version = false,
  event = 'VeryLazy',
  config = function()
    local mini_diff = require('mini.diff')
    mini_diff.setup({
      view = {
        style = 'sign',
        signs = { add = '+', change = '~', delete = '-' },
        priority = 199,
      },
      source = { mini_diff.gen_source.git(), mini_diff.gen_source.save() },
      mappings = {
        apply = '',
        reset = '',
        textobject = '',
        goto_first = '',
        goto_prev = '',
        goto_next = '',
        goto_last = '',
      },
    })
  end,
  keys = {
    {
      'gdt',
      function() require('mini.diff').toggle() end,
      desc = 'Toggle for current buffer',
    },
    {
      'gdv',
      function() require('mini.diff').toggle_overlay() end,
      desc = 'Toggle overlay',
    },
  },
}
