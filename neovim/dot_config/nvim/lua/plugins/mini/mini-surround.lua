return {
  'nvim-mini/mini.surround',
  version = false,
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = '<leader>za',
        delete = '<leader>zd',
        find = '', -- Disabled
        find_left = '', -- Disabled
        highlight = '', -- Disabled
        replace = '<leader>zr',
        suffix_last = '', -- Disabled
        suffix_next = '', -- Disabled
      }
    })
  end,
}
