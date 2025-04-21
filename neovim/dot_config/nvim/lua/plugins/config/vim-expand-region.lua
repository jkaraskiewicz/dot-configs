-- Expand a region like in IntelliJ IDEA

vim.keymap.set('x', 'v', '<Plug>(expand_region_expand)', { noremap = true, silent = true, desc = 'Expand region' })
vim.keymap.set('x', 'V', '<Plug>(expand_region_shrink)', { noremap = true, silent = true, desc = 'Shrink region' })
