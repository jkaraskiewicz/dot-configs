return {
  {
    'neovim/nvim-lspconfig',
    version = false,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    keys = function() return {} end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    version = false,
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'angularls',
          'bashls',
          'html',
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
