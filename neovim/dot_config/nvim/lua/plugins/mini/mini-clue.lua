return {
  'echasnovski/mini.clue',
  dependencies = {
    'jkaraskiewicz/toggle.nvim',
  },
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
        { mode = 'n', keys = '<C-w>' },
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
        -- `{`, `}`
        { mode = 'n', keys = '{' },
        { mode = 'n', keys = '}' },

        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
      },
      clues = {
        { mode = 'n', keys = 'gd',         desc = '+Diff' },
        { mode = 'n', keys = '<leader>a',  desc = '+AI' },
        { mode = 'x', keys = '<leader>a',  desc = '+AI' },
        { mode = 'n', keys = '<leader>ao', desc = '+Opencode' },
        { mode = 'x', keys = '<leader>ao', desc = '+Opencode' },
        { mode = 'n', keys = '<leader>b',  desc = '+Buffer' },
        { mode = 'n', keys = '<leader>B',  desc = '+Bookmarks' },
        { mode = 'n', keys = '<leader>d',  desc = '+Diff' },
        { mode = 'n', keys = '<leader>e',  desc = '+Explorer' },
        { mode = 'n', keys = '<leader>f',  desc = '+Find' },
        { mode = 'n', keys = '<leader>fo', desc = '+Other' },
        { mode = 'n', keys = '<leader>m',  desc = '+Misc' },
        { mode = 'n', keys = '<leader>r',  desc = '+Refactor' },
        { mode = 'x', keys = '<leader>r',  desc = '+Refactor' },
        { mode = 'n', keys = '<leader>rg', desc = '+Global' },
        { mode = 'n', keys = '<leader>S',  desc = '+Sessions' },
        { mode = 'n', keys = '<leader>s',  desc = '+Search' },
        { mode = 'x', keys = '<leader>s',  desc = '+Search' },
        { mode = 'n', keys = '<leader>t',  desc = '+Toggles' },

        require('toggle').clues(),

        require('mini.clue').gen_clues.builtin_completion(),
        require('mini.clue').gen_clues.registers(),
        require('mini.clue').gen_clues.windows(),
      },
      window = {
        delay = 300,
        config = {
          width = 50,
          border = 'single',
        },
      },
    })
  end,
}
