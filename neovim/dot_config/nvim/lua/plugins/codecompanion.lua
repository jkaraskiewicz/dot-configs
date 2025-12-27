return {
  'olimorris/codecompanion.nvim',
  version = '^18.0.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    adapters = {
      http = {
        openrouter_mistral = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = {
              url = 'https://openrouter.ai/api',
              api_key = 'OPENROUTER_API_KEY',
              chat_url = '/v1/chat/completions',
            },
            schema = {
              model = {
                default = 'mistralai/devstral-2512:free',
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = 'openrouter_mistral',
      },
      inline = {
        adapter = 'openrouter_mistral',
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
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
  keys = {
    { '<leader>an', ':CodeCompanionChat<CR>',        mode = { 'n', 'v' }, desc = 'Open chat buffer' },
    { '<leader>at', ':CodeCompanionChat Toggle<CR>', mode = { 'n', 'v' }, desc = 'Toggle chat buffer' },
    { '<leader>aa', ':CodeCompanionChat Add<CR>',    mode = { 'n', 'v' }, desc = 'Add to chat buffer' },
    { '<leader>ac', ':CodeCompanionActions<CR>',     mode = { 'n', 'v' }, desc = 'Open actions palette' },
    { '<leader>ai', ':CodeCompanion<CR>',            mode = { 'n', 'v' }, desc = 'Inline assistant' },
  },
}
