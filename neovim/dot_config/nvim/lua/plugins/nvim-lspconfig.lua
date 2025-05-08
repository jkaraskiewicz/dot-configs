return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function()
          require('mason').setup()
        end,
      },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    keys = function() return {} end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'angularls',
          'bashls',
          'jdtls',
          'jsonls',
          'kotlin_language_server',
          'lua_ls',
          'rust_analyzer',
          'ts_ls',
          'yamlls',
        },
      })
    end,
  },
}
