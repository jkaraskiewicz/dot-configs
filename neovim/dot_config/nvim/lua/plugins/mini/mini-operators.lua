return {
  'echasnovski/mini.operators',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.operators').setup({
      evaluate = {
        prefix = '',
      },
      exchange = {
        prefix = 'mx',
      },
      multiply = {
        prefix = 'mm',
      },
      replace = {
        prefix = 'mr',
      },
      sort = {
        prefix = 'ms',
      },
    })
  end,
}
