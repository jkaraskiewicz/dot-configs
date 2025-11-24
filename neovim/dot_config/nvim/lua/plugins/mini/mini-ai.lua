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

        -- Entire buffer content
        B = require('mini.extra').gen_ai_spec.buffer(),

        -- Treesitter-based text objects (language-aware)
        -- Function argument/parameter
        a = gen_spec.treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),

        -- Function call
        c = gen_spec.treesitter({ a = '@call.outer', i = '@call.inner' }),

        -- Function/method declaration
        m = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),

        -- Code block (if/for/while/match)
        b = gen_spec.treesitter({ a = '@block.outer', i = '@block.inner' }),

        -- Return statement
        r = gen_spec.treesitter({ a = '@return.outer', i = '@return.inner' }),

        -- Struct field
        f = gen_spec.treesitter({ a = '@field.outer', i = '@field.outer' }),

        -- Rust-specific text objects
        -- Struct definition
        S = gen_spec.treesitter({ a = '@struct.outer', i = '@struct.inner' }),

        -- Trait definition
        T = gen_spec.treesitter({ a = '@trait.outer', i = '@trait.inner' }),

        -- Impl block
        i = gen_spec.treesitter({ a = '@impl.outer', i = '@impl.inner' }),

        -- Enum definition
        e = gen_spec.treesitter({ a = '@enum.outer', i = '@enum.inner' }),
      },
      mappings = {
        goto_left = '',
        goto_right = '',
      },
      n_lines = 100, -- Reduced from 250 for better performance
    })
  end,
}
