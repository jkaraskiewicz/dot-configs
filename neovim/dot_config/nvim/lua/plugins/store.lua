return {
  'alex-popov-tech/store.nvim',
  dependencies = {
    'OXY2DEV/markview.nvim', -- optional, for pretty readme preview / help window
  },
  cmd = 'Store',
  keys = {
    { '<leader>mS', '<cmd>Store<cr>', desc = 'Plugin Store' },
  },
  opts = {},
}
