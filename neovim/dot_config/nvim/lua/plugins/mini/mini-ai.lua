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
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line('$'),
            col = math.max(vim.fn.getline('$'):len(), 1),
          }
          return { from = from, to = to }
        end,
      },
      mappings = {
        goto_left = '',
        goto_right = '',
      },
      n_lines = 250,
    })
  end,
}
