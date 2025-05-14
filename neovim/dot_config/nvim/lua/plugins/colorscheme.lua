return {
  'lmantw/themify.nvim',
  lazy = false,
  priority = 1000,
  config = {
    'rebelot/kanagawa.nvim',
    'xiantang/darcula-dark.nvim',
    'rose-pine/neovim',
    'sainnhe/gruvbox-material',
    'Mofiqul/vscode.nvim',
  },
  keys = {
    { '<leader>mc', ':Themify<cr>', desc = 'Color schemes' },
  },
}
