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
    lazy = false,
    keys = function() return {} end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'angularls',
        'bashls',
        'java_language_server',
        'jsonls',
        'kotlin_language_server',
        'lua_ls',
        'rust_analyzer',
        'ts_ls',
        'yamlls',
      },
      handlers = {
        function(server_name)
          -- Attempt to load a specific config, otherwise use empty setup
          local M_setup, config_module = pcall(require, 'plugins.lsp.' .. server_name)
          if M_setup and type(config_module) == 'table' then
            -- Optionally, merge a global on_attach if it exists and isn't overridden
            if vim.g.lsp_on_attach and config_module.on_attach == nil then
              config_module.on_attach = vim.g.lsp_on_attach
            end
            require('lspconfig')[server_name].setup(config_module)
          else
            -- If config module not found or invalid, set up with defaults (and global on_attach if any)
            local default_opts = {}
            if vim.g.lsp_on_attach then
              default_opts.on_attach = vim.g.lsp_on_attach
            end
            require('lspconfig')[server_name].setup(default_opts)
          end
        end,
      },
    },
  },
}
