local map = vim.keymap.set

-- Configuration constants
local COLOR_COLUMN_WIDTH = 80

-- Buffers
map('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
map('n', '<leader>bb', function() vim.cmd('Pick buffers') end, { desc = 'Buffer picker' })

-- General
map('n', '<Esc>', '<cmd>noh<cr>', { desc = 'Clear search' })

-- Bracket navigation (next/previous)
map('n', ']d', function() vim.diagnostic.goto_next() end, { desc = 'Next diagnostic' })
map('n', '[d', function() vim.diagnostic.goto_prev() end, { desc = 'Previous diagnostic' })
map('n', ']h', function() require('mini.diff').goto_hunk('next') end, { desc = 'Next hunk' })
map('n', '[h', function() require('mini.diff').goto_hunk('prev') end, { desc = 'Previous hunk' })
map('n', ']q', function() vim.cmd('cnext') end, { desc = 'Next quickfix' })
map('n', '[q', function() vim.cmd('cprev') end, { desc = 'Previous quickfix' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })

-- Toggles
map('n', '<leader>tr', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle relative numbers' })

map('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })

map('n', '<leader>tc', function()
  if vim.wo.colorcolumn == '' then
    vim.wo.colorcolumn = tostring(COLOR_COLUMN_WIDTH)
  else
    vim.wo.colorcolumn = ''
  end
end, { desc = 'Toggle color column' })

map('n', '<leader>ci', function()
  local current_state = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
  vim.lsp.inlay_hint.enable(not current_state, { bufnr = 0 })
  local state_text = current_state and 'disabled' or 'enabled'
  vim.notify('Inlay hints ' .. state_text, vim.log.levels.INFO)
end, { desc = 'Toggle inlay hints' })

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

-- Better movement / editing
map('n', 'gf', 'dlph', { desc = 'Swap letters' })
map('n', 'gv', 'gv', { noremap = true, desc = 'Last visual selection' })

-- Improved yank/delete/paste workflow
-- x/X never yank (black hole register)
map('n', 'x', '"_x', { desc = 'Delete char (no yank)' })
map('n', 'X', '"_X', { desc = 'Delete char backward (no yank)' })

-- Visual paste doesn't replace register (uses yank register "0)
map('x', 'p', '"0p', { desc = 'Paste (keep register)' })
map('x', 'P', '"0P', { desc = 'Paste before (keep register)' })

-- Delete without yanking (black-hole register)
map({ 'n', 'x' }, '-', '"_d', { desc = 'Delete (no yank)' })

-- LSP Navigation
map('n', 'gd', function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
map('n', 'gr', function() vim.lsp.buf.references() end, { desc = 'Go to references' })
map('n', 'gI', function() vim.lsp.buf.implementation() end, { desc = 'Go to implementation' })
map('n', 'gy', function() vim.lsp.buf.type_definition() end, { desc = 'Go to type definition' })
map('n', 'gD', function() vim.lsp.buf.declaration() end, { desc = 'Go to declaration' })
map('n', 'K', function() vim.lsp.buf.hover() end, { desc = 'Hover documentation' })

-- Code operations are buffer-local and set in lua/config/autocmds.lua on LspAttach
