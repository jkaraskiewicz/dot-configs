return {
  'olimorris/codecompanion.nvim',
  version = '^18.0.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    interactions = {
      chat = {
        adapter = 'opencode',
      },
      inline = {
        adapter = 'opencode',
      },
    },
    display = {
      action_palette = {
        provider = 'mini_pick',
      },
    },
    opts = {
      log_level = 'DEBUG',
    },
  },
  keys = {
    { '<leader>an', ':CodeCompanionChat<CR>',        mode = { 'n', 'v' }, desc = 'Open chat buffer' },
    { '<leader>at', ':CodeCompanionChat Toggle<CR>', mode = { 'n', 'v' }, desc = 'Toggle chat buffer' },
    { '<leader>aa', ':CodeCompanionChat Add<CR>',    mode = { 'n', 'v' }, desc = 'Add to chat buffer' },
    { '<leader>ac', ':CodeCompanionActions<CR>',     mode = { 'n', 'v' }, desc = 'Open actions palette' },
    { '<leader>ai', ':CodeCompanion<CR>',            mode = { 'n', 'v' }, desc = 'Inline assistant' },
  },
}
