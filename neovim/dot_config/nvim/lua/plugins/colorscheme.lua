return {
  'lmantw/themify.nvim',
  lazy = false,
  priority = 1000,
  config = {
    'rebelot/kanagawa.nvim',
    'xiantang/darcula-dark.nvim',
  },
  keys = {
    { '<leader>mc', ':Themify<cr>', desc = 'Color schemes' },
  },
}
