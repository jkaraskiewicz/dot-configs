return {
  'williamboman/mason.nvim',
  version = false,
  config = function()
    require('mason').setup()
  end,
}
