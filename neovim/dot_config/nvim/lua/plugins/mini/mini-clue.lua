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
        -- `-` key (delete no yank)
        { mode = 'n', keys = '-' },
        { mode = 'x', keys = '-' },
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
        { mode = 'n', keys = '<leader>b',  desc = '+Buffer' },
        { mode = 'n', keys = '<leader>c',  desc = '+Code' },
        { mode = 'x', keys = '<leader>c',  desc = '+Code' },
        { mode = 'n', keys = '<leader>e',  desc = '+Explorer' },
        { mode = 'n', keys = '<leader>f',  desc = '+Find' },
        { mode = 'n', keys = '<leader>m',  desc = '+Misc' },
        { mode = 'n', keys = '<leader>s',  desc = '+Search' },
        { mode = 'x', keys = '<leader>s',  desc = '+Search' },
        { mode = 'n', keys = '<leader>S',  desc = '+Sessions' },
        { mode = 'n', keys = '<leader>t',  desc = '+Toggles' },
        { mode = 'n', keys = '<leader>v',  desc = '+VCS' },

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
