return {
  'AckslD/muren.nvim',
  config = true,
  keys = {
    { '<leader>sm', function() require('muren.api').toggle_ui() end, desc = 'Multi search/replace' },
  },
}
