local map = vim.keymap.set

-- Set current buffer filetype
map('n', '<leader>blr', function()
  vim.bo.filetype = 'rust'
end, { noremap = true, silent = false, desc = 'Set filetype to Rust' })

map('n', '<leader>bljv', function()
  vim.bo.filetype = 'java'
end, { noremap = true, silent = false, desc = 'Set filetype to Java' })

map('n', '<leader>blz', function()
  vim.bo.filetype = 'zsh'
end, { noremap = true, silent = false, desc = 'Set filetype to Zsh' })

map('n', '<leader>blk', function()
  vim.bo.filetype = 'kotlin'
end, { noremap = true, silent = false, desc = 'Set filetype to Kotlin' })

map('n', '<leader>blt', function()
  vim.bo.filetype = 'javascript'
end, { noremap = true, silent = false, desc = 'Set filetype to Typescript' })

map('n', '<leader>bljn', function()
  vim.bo.filetype = 'json'
end, { noremap = true, silent = false, desc = 'Set filetype to JSON' })

map('n', '<leader>bly', function()
  vim.bo.filetype = 'yaml'
end, { noremap = true, silent = false, desc = 'Set filetype to YAML' })

map('n', '<leader>bls', function()
  vim.bo.filetype = 'sh'
end, { noremap = true, silent = false, desc = 'Set filetype to Shell' })

map('n', '<leader>blm', function()
  vim.bo.filetype = 'markdown'
end, { noremap = true, silent = false, desc = 'Set filetype to Markdown' })

map('n', '<leader>blc', function()
  vim.bo.filetype = 'cpp'
end, { noremap = true, silent = false, desc = 'Set filetype to C++' })

map('n', '<leader>bll', function()
  vim.bo.filetype = 'lua'
end, { noremap = true, silent = false, desc = 'Set filetype to Lua' })

-- Mini commands
map('n', '<leader>Xu', function()
  require('mini.deps').update()
end, { noremap = true, silent = false, desc = 'Update plugins' })

map('n', '<leader>Xc', '<cmd>DepsClean<cr>', {
  noremap = true,
  silent = false,
  desc = 'Clean-up',
})

-- Buffers
map('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Close buffer' })
map('n', '<leader>bq', '<cmd>%bd|e#<cr>', { desc = 'Close other buffers' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<TAB>', '<C-^>', { desc = 'Alternate buffers' })

-- Refactor
map('n', '<leader>rr', function() vim.lsp.buf.rename() end,
  { desc = 'Rename this' })
map('n', '<leader>ra', function() vim.lsp.buf.code_action() end,
  { desc = 'Code actions' })
map('n', '<leader>re',
  function() require('mini.extra').pickers.diagnostic({ scope = 'current' }) end,
  { desc = 'LSP errors in buffer' })
map('n', '<leader>rq', function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = 'LSP quickfix' })

-- General
map('n', '<Esc>', '<cmd>noh<cr>', { desc = 'Clear search' })
map('i', '<C-Space>', 'require("mini.completion").complete()', {
  noremap = true,
  silent = true,
  desc =
  'Trigger completion',
})

-- Stay in indent mode
map('x', '<', '<gv', { desc = 'Indent left (Visual)' })
map('x', '>', '>gv', { desc = 'Indent right (Visual)' })

-- Better navigation in insert mode
map('i', '<C-h>', '<Left>', { desc = 'Move cursor left' })
map('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })
map('i', '<C-j>', '<Down>', { desc = 'Move cursor down' })
map('i', '<C-k>', '<Up>', { desc = 'Move cursor up' })
