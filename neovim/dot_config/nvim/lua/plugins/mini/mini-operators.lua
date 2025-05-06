return {
  'echasnovski/mini.operators',
  version = false,
  config = function()
    require('mini.operators').setup({
      evaluate = {
        prefix = 'goe',
      },
      exchange = {
        prefix = 'gox',
      },
      multiply = {
        prefix = 'gom',
      },
      replace = {
        prefix = 'gor',
      },
      sort = {
        prefix = 'gos',
      },
    })
  end,
}
