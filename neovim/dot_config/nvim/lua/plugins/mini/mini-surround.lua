return {
  'nvim-mini/mini.surround',
  version = false,
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = 'Za',
        delete = 'Zd',
        find = '', -- Disabled
        find_left = '', -- Disabled
        highlight = '', -- Disabled
        replace = 'Zr',
        suffix_last = '', -- Disabled
        suffix_next = '', -- Disabled
      }
    })
  end,
}
