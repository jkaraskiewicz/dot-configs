return {
  'nvim-mini/mini.cursorword',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.cursorword').setup()
  end,
}
