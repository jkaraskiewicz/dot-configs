return {
  'echasnovski/mini.surround',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = 'sa',
        delete = 'sd',
        replace = 'sr',
        find = '',
        find_left = '',
        highlight = '',
        update_n_lines = '',
      },
    })
  end,
}
