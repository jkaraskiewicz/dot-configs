return {
  'echasnovski/mini.keymap',
  version = false,
  config = function()
    require('mini.keymap').setup()
    local map_combo = require('mini.keymap').map_combo
    local opts = { delay = 500 }
    -- mini.pairs always inserts a closing bracket automatically
    -- these combo keymaps remove the closing brackets
    map_combo({ 'i' }, '(<bs>', '(<Esc>lcl', opts)
    map_combo({ 'i' }, '{<bs>', '{<Esc>lcl', opts)
    map_combo({ 'i' }, '[<bs>', '[<Esc>lcl', opts)
    map_combo({ 'i' }, "'<bs>", "'<Esc>lcl", opts)
    map_combo({ 'i' }, '"<bs>', '"<Esc>lcl', opts)
  end,
}
