local map = vim.keymap.set

-- =============================================================================
-- BUFFER MANAGEMENT
-- =============================================================================
map('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
map('n', '<leader>bb', function()
  require('mini.pick').builtin.buffers()
end, { desc = 'Buffer picker' })

-- =============================================================================
-- GENERAL
-- =============================================================================
map('n', '<Esc>', '<cmd>noh<cr>', { desc = 'Clear search' })

-- =============================================================================
-- VISUAL MODE IMPROVEMENTS
-- =============================================================================
-- Stay in indent mode (can press < or > multiple times)
map('x', '<', '<gv', { desc = 'Indent left (Visual)' })
map('x', '>', '>gv', { desc = 'Indent right (Visual)' })

-- =============================================================================
-- TERMINAL MODE
-- =============================================================================
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode', noremap = true, silent = true })

-- =============================================================================
-- REGISTER WORKFLOW (Improved yank/delete/paste)
-- =============================================================================
-- Delete character without yanking (black hole register)
map('n', 'x', '"_x', { desc = 'Delete char (no yank)' })
map('n', 'X', '"_X', { desc = 'Delete char backward (no yank)' })

-- Visual paste doesn't replace register (uses yank register "0)
-- Note: Only works for yanked text, not deleted text
map('x', 'p', '"0p', { desc = 'Paste (keep register)' })
map('x', 'P', '"0P', { desc = 'Paste before (keep register)' })

-- =============================================================================
-- NAVIGATION & LSP
-- =============================================================================
-- Navigation uses Neovim 0.10+ defaults:
--   ]d/[d     - next/prev diagnostic
--   ]D/[D     - last/first diagnostic
--   ]q/[q     - next/prev quickfix
--   ]Q/[Q     - last/first quickfix
--   ]b/[b     - next/prev buffer
--
-- LSP keybinds use Neovim 0.10+ defaults:
--   grr       - references
--   grd       - definition
--   gri       - implementation
--   grt       - type definition
--   gra       - code action
--   grn       - rename
--   K         - hover
--   gO        - document symbols
--
-- Additional LSP operations are buffer-local and set in lua/config/autocmds.lua
