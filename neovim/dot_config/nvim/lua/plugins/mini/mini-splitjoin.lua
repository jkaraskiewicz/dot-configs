return {
  'nvim-mini/mini.splitjoin',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.splitjoin').setup({
      mappings = {
        toggle = '',
      },
    })
  end,
  keys = {
    {
      'gj',
      function()
        require('mini.splitjoin').toggle()
      end,
      desc = 'Split / join arguments',
    },
  },
}
