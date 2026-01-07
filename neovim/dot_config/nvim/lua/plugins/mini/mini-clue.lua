return {
  'nvim-mini/mini.clue',
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
        -- Windows
        { mode = 'n', keys = '<C-w>' },
        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        -- `s` key
        { mode = 'n', keys = 's' },
        { mode = 'x', keys = 's' },
        -- `m` key -- currently not used
        { mode = 'n', keys = 'm' },
        { mode = 'x', keys = 'm' },
        -- `[`, `]`
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        -- `{`, `}`
        { mode = 'n', keys = '{' },
        { mode = 'n', keys = '}' },
        -- Clipboard
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        -- `Z` key
        { mode = 'n', keys = 'Z' },
        { mode = 'x', keys = 'Z' },
      },
      clues = {
        -- '<leader>' prefix
        { mode = 'n', keys = '<leader>a',  desc = '+AI' },
        { mode = 'x', keys = '<leader>a',  desc = '+AI' },
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

        -- 'g' prefix
        { mode = 'n', keys = 'gr',  desc = '+LSP Actions' },
        { mode = 'x', keys = 'gr',  desc = '+LSP Actions' },

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

    -- KEYBINDS DESCRIPTIONS OVERRIDES
    require('mini.clue').set_mapping_desc('n', 'ge', 'Back to word end')
    require('mini.clue').set_mapping_desc('n', 'gE', 'Back to WORD end')
    require('mini.clue').set_mapping_desc('x', 'ge', 'Back to word end')
    require('mini.clue').set_mapping_desc('x', 'gE', 'Back to WORD end')
    require('mini.clue').set_mapping_desc('n', 'gO', 'Document symbols')
    require('mini.clue').set_mapping_desc('n', 'gx', 'Open with system')
    require('mini.clue').set_mapping_desc('n', 'gra', 'LSP Code Action')
    require('mini.clue').set_mapping_desc('n', 'gri', 'Go to implementation')
    require('mini.clue').set_mapping_desc('n', 'grn', 'Rename symbol')
    require('mini.clue').set_mapping_desc('n', 'grr', 'List references')
    require('mini.clue').set_mapping_desc('n', 'grt', 'Type definition')
  end,
}
