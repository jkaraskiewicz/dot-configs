local map = vim.keymap.set

-- Buffers
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<TAB>', '<C-^>', { desc = 'Alternate buffers' })

-- General
map('n', '<Esc>', '<cmd>noh<cr>', { desc = 'Clear search' })
map('n', '<leader>mm', ':messages<cr>', { desc = 'Show messages' })
map('n', '<leader>mr', ':restart<cr>', { desc = 'Restart neovim' })

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

-- Refactor
map('n', '<leader>rR', function() vim.lsp.buf.rename() end, { desc = 'Rename' })
map({ 'n', 'x' }, '<leader>ra', function() vim.lsp.buf.code_action() end, { desc = 'Code actions' })
map('n', '<leader>re', function() require('mini.extra').pickers.diagnostic({ scope = 'current' }) end,
  { desc = 'Diagnostics' })
map('n', '<leader>rq', function() require('mini.extra').pickers.list({ scope = 'quickfix' }) end, { desc = 'Quickfixes' })
map('n', '<leader>rf', function() vim.lsp.buf.format() end, { desc = 'Format buffer' })
map('n', '<leader>rgq', function() vim.diagnostic.setqflist({ open = true }) end, { desc = 'Quickfixes' })

-- Redirect gr to <leader>r
map(
  { 'n', 'x' },
  'gr',
  function()
    vim.schedule(
      function()
        vim.api.nvim_feedkeys(vim.g.mapleader .. 'r', 't', false)
      end
    )
  end,
  { noremap = true, silent = true, desc = '+Refactor' }
)
