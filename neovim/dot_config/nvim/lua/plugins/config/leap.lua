-- Leap anywhere by pressing first two characters

vim.keymap.set({ 'n', 'x', 'o' }, ';', '<Plug>(leap)')

vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'Black', bg = 'White', bold = true })
