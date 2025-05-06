local map = vim.keymap.set

-- Buffers
map('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Close buffer' })
map('n', '<leader>bq', '<cmd>%bd|e#<cr>', { desc = 'Close other buffers' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<TAB>', '<C-^>', { desc = 'Alternate buffers' })

-- Refactor
map('n', '<leader>rr', function() vim.lsp.buf.rename() end,
  { desc = 'Rename' })
map('n', '<leader>ra', function() vim.lsp.buf.code_action() end,
  { desc = 'Code actions' })
map('n', '<leader>re',
  function() require('mini.extra').pickers.diagnostic({ scope = 'current' }) end,
  { desc = 'LSP errors in buffer' })
map('n', '<leader>rq', function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = 'LSP quickfix' })
map('n', '<leader>rf', function() vim.lsp.buf.format() end, { desc = 'Format buffer' })

-- General
map('n', '<Esc>', '<cmd>noh<cr>', { desc = 'Clear search' })

-- Stay in indent mode
map('x', '<', '<gv', { desc = 'Indent left (Visual)' })
map('x', '>', '>gv', { desc = 'Indent right (Visual)' })

-- Better navigation in insert mode
map('i', '<C-h>', '<Left>', { desc = 'Move cursor left' })
map('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })
map('i', '<C-j>', '<Down>', { desc = 'Move cursor down' })
map('i', '<C-k>', '<Up>', { desc = 'Move cursor up' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

