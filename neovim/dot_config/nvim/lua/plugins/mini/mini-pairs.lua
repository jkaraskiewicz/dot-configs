return {
  'echasnovski/mini.pairs',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.pairs').setup()

    -- mini.pairs will automatically enter a closing bracket, quote etc.
    -- to enter a single opening character, use these keybinds:
    vim.keymap.set('i', '<localleader>(', '(', { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>[', '[', { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>{', '{', { noremap = true, silent = true })
    vim.keymap.set('i', "<localleader>'", "'", { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>"', '"', { noremap = true, silent = true })
    vim.keymap.set('i', '<localleader>`', '`', { noremap = true, silent = true })
  end,
}
