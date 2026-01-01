return {
  'backdround/global-note.nvim',
  version = false,
  config = function()
    require('global-note').setup()
  end,
  keys = {
    { '<leader>mn', function() require('global-note').toggle_note() end, desc = 'Open notes' },
  },
}
