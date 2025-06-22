return {
  'echasnovski/mini.ai',
  version = false,
  event = 'VeryLazy',
  config = function()
    local gen_spec = require('mini.ai').gen_spec
    require('mini.ai').setup({
      custom_textobjects = {
        -- Big word (contains: _, -)
        W = { '[^%w_%-]()[%w_%-]+()[^%w_%-]' },
        -- Function argument
        a = gen_spec.argument(),
        -- Function call (utilizes custom textobjects from after/queries/ )
        c = gen_spec.treesitter({ a = '@call.outer', i = '@call.inner' }),
        -- Function declaration (utilizes custom textobjects from after/queries/ )
        m = gen_spec.treesitter({ a = '@method.outer', i = '@method.inner' }),
        -- Chain of non-whitespace characters
        s = { '%s()[^%s]+()%s' },
        -- Entire buffer content
        B = require('mini.extra').gen_ai_spec.buffer(),
        -- Current indented block
        I = require('mini.extra').gen_ai_spec.indent(),
      },
      mappings = {
        goto_left = '',
        goto_right = '',
      },
      n_lines = 250,
    })
  end,
}
