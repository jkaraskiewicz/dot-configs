return {
  'nvim-mini/mini.ai',
  version = false,
  event = 'VeryLazy',
  config = function()
    local gen_spec = require('mini.ai').gen_spec
    require('mini.ai').setup({
      custom_textobjects = {
        -- Big word (contains: _, -)
        W = { '[^%w_%-]()[%w_%-]+()[^%w_%-]' },

        -- Entire buffer content
        B = require('mini.extra').gen_ai_spec.buffer(),

        -- Function argument/parameter
        a = gen_spec.treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),

        -- Function call
        c = gen_spec.treesitter({ a = '@call.outer', i = '@call.inner' }),

        -- Function/method declaration
        m = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),

        -- Code block (if/for/while/match)
        -- b = gen_spec.treesitter({ a = '@block.outer', i = '@block.inner' }),
        b = false, -- Use NeoVim default block object
      },
      mappings = {
        around_next = '', -- Disabled
        inside_next = '', -- Disabled
        around_last = '', -- Disabled
        inside_last = '', -- Disabled
        goto_left = '', -- Disabled
        goto_right = '', -- Disabled
      },
      n_lines = 100, -- Reduced from 250 for better performance
    })
  end,
}
