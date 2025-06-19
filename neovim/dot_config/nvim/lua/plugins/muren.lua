return {
  'AckslD/muren.nvim',
  version = false,
  config = true,
  keys = {
    { '<leader>sm', function() require('muren.api').toggle_ui() end, desc = 'Multi search / replace' },
  },
}
