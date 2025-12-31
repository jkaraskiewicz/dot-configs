return {
  'nvim-mini/mini.trailspace',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.trailspace').setup()
  end,
}
