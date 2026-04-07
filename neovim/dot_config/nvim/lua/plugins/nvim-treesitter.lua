return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'abs',
        'angular',
        'bash',
        'css',
        'dockerfile',
        'html',
        'java',
        'javascript',
        'json',
        'kotlin',
        'lua',
        'markdown',
        'proto',
        'python',
        'rust',
        'scheme',
        'textproto',
        'toml',
        'typescript',
        'vim',
        'yaml',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          scope_incremental = '<Tab>',
          node_decremental = '<S-CR>',
        },
      }
    })

    local repeatable_move = require('nvim-treesitter.textobjects.repeatable_move')

    vim.keymap.set({ 'n', 'x', 'o' }, ']]', repeatable_move.repeat_last_move_next,
      { noremap = true, silent = true, desc = 'Repeat last next move' })

    vim.keymap.set({ 'n', 'x', 'o' }, '[[', repeatable_move.repeat_last_move_previous,
      { noremap = true, silent = true, desc = 'Repeat last previous move' })
  end,
}
