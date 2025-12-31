return {
  'nvim-mini/mini.operators',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.operators').setup({
      sort = {
        prefix = 'gs',
        func = nil,
      },
      evaluate = {
        prefix = '', -- Disabled
      },
      exchange = {
        prefix = '', -- Disabled
      },
      multiply = {
        prefix = '', -- Disabled
      },
      replace = {
        prefix = '', -- Disabled
      },
    })
  end,
}
