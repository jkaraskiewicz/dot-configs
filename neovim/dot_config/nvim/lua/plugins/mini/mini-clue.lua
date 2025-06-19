return {
  'echasnovski/mini.clue',
  version = false,
  event = 'VeryLazy',
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
        -- `m` key
        { mode = 'n', keys = 'm' },
        { mode = 'x', keys = 'm' },
        -- `[`, `]`
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
      },
      clues = {
        { mode = 'n', keys = 'gr',         desc = '+Refactor' },
        { mode = 'x', keys = 'gr',         desc = '+Refactor' },
        { mode = 'n', keys = 'grg',        desc = '+Global' },

        { mode = 'n', keys = '<leader>b',  desc = '+Buffer' },
        { mode = 'n', keys = '<leader>B',  desc = '+Bookmarks' },
        { mode = 'n', keys = '<leader>e',  desc = '+Explorer' },
        { mode = 'n', keys = '<leader>f',  desc = '+Find' },
        { mode = 'n', keys = '<leader>fo', desc = '+Other' },
        { mode = 'x', keys = '<leader>fo', desc = '+Other' },
        { mode = 'n', keys = '<leader>m',  desc = '+Misc' },
        { mode = 'n', keys = '<leader>md', desc = '+Diff' },
        { mode = 'n', keys = '<leader>S',  desc = '+Sessions' },
        { mode = 'n', keys = '<leader>s',  desc = '+Search' },
        { mode = 'x', keys = '<leader>s',  desc = '+Search' },
        require('mini.clue').gen_clues.builtin_completion(),
        require('mini.clue').gen_clues.registers(),
        require('mini.clue').gen_clues.windows(),
      },
      window = {
        delay = 100,
        config = {
          width = 50,
          border = 'single',
        },
      },
    })
  end,
}
