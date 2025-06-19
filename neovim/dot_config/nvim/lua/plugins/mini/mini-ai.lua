return {
  'echasnovski/mini.ai',
  version = false,
  event = 'VeryLazy',
  config = function()
    local gen_spec = require('mini.ai').gen_spec
    require('mini.ai').setup({
      custom_textobjects = {
        W = { '[^%w_%-]()[%w_%-]+()[^%w_%-]' },
        c = gen_spec.treesitter({ a = '@call.outer', i = '@call.inner' }),
        m = gen_spec.treesitter({ a = '@method.outer', i = '@method.inner' }),
        s = { '%s()[^%s]+()%s' },
      },
      mappings = {
        goto_left = '',
        goto_right = '',
      },
      n_lines = 250,
    })
  end,
}
