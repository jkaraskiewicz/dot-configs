return {
  'otavioschwanck/arrow.nvim',
  version = false,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
  opts = {
    show_icons = true,
    leader_key = '<leader>Bf',
    buffer_leader_key = '<leader>Bb',
  },
  keys = {
    { '<leader>Bf', function() require('arrow.ui').openMenu() end,        desc = 'File bookmarks' },
    { '<leader>Bb', function() require('arrow.buffer_ui').openMenu() end, desc = 'Buffer bookmarks' },
  },
}
