return {
  'echasnovski/mini.surround',
  version = false,
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = 'za',
        delete = 'zd',
        replace = 'zr',
      },
    })
  end,
}
