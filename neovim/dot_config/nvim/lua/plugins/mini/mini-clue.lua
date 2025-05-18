return {
  'echasnovski/mini.clue',
  version = false,
  config = function()
    require('mini.clue').setup({
      triggers = {
        -- Leader key completion
        { mode = 'n', keys = '<leader>' },
        { mode = 'x', keys = '<leader>' },
        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },
        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
        -- `s` key
        { mode = 'n', keys = 's' },
        { mode = 'x', keys = 's' },
        -- `[`, `]`
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
      },
      clues = {
        -- Operators, refactors (under 'g')
        { mode = 'n', keys = 'go',         desc = '+Operators' },
        { mode = 'n', keys = 'gr',         desc = '+Refactor' },
        { mode = 'x', keys = 'go',         desc = '+Operators' },
        { mode = 'x', keys = 'gr',         desc = '+Refactor' },

        { mode = 'n', keys = '<leader>e',  desc = '+Explorer' },
        { mode = 'n', keys = '<leader>m',  desc = '+Misc' },
        { mode = 'n', keys = '<leader>M',  desc = '+Macros' },
        { mode = 'n', keys = '<leader>f',  desc = '+Find' },
        { mode = 'x', keys = '<leader>f',  desc = '+Find' },
        { mode = 'n', keys = '<leader>S',  desc = '+Sessions' },
        { mode = 'n', keys = '<leader>s',  desc = '+Search' },
        { mode = 'x', keys = '<leader>s',  desc = '+Search' },
        { mode = 'n', keys = '<leader>r',  desc = '+Refactor' },
        { mode = 'n', keys = '<leader>b',  desc = '+Buffer' },
        require('mini.clue').gen_clues.builtin_completion(),
        require('mini.clue').gen_clues.registers(),
        require('mini.clue').gen_clues.windows(),
        -- require('mini.clue').gen_clues.g(),
        -- require('mini.clue').gen_clues.z(),
      },
      window = {
        delay = 100,
        config = {
          width = 50,
          border = 'double',
        },
      },
    })
  end,
}
