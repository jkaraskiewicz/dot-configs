return {
  'AckslD/muren.nvim',
  version = false,
  config = true,
  keys = {
    { '<leader>sR', function() require('muren.api').toggle_ui() end, desc = 'Replace in project' },
  },
}
