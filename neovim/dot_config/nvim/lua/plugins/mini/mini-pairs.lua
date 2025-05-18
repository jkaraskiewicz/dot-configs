return {
  'echasnovski/mini.pairs',
  version = false,
  config = function()
    require('mini.pairs').setup()

    vim.keymap.set('i', '<localleader>(', '(', { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>[', '[', { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>{', '{', { noremap = true, silent = true })
    vim.keymap.set('i', "<localleader>'", "'", { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>"', '"', { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>`', '`', { noremap = true, silent = true })
  end,
}
