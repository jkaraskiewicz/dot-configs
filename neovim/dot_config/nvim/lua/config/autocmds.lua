local function lsp_on_attach(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

  -- LSP navigation pickers
  vim.keymap.set('n', '<leader>cg', function() require('mini.extra').pickers.lsp({ scope = 'definition' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code go to definition' }))
  vim.keymap.set('n', '<leader>cR', function() require('mini.extra').pickers.lsp({ scope = 'references' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code references' }))
  vim.keymap.set('n', '<leader>ci', function() require('mini.extra').pickers.lsp({ scope = 'implementation' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code implementation' }))
  vim.keymap.set('n', '<leader>cD', function() require('mini.extra').pickers.lsp({ scope = 'declaration' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code declaration' }))
  vim.keymap.set('n', '<leader>ct', function() require('mini.extra').pickers.lsp({ scope = 'type_definition' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code type definition' }))

  -- LSP utility pickers
  vim.keymap.set('n', '<leader>cs', function() require('mini.extra').pickers.lsp({ scope = 'document_symbol' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code symbols' }))
  vim.keymap.set('n', '<leader>cd', function() require('mini.extra').pickers.diagnostic({ scope = 'current' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code diagnostics' }))
  vim.keymap.set('n', '<leader>cq', function() require('mini.extra').pickers.list({ scope = 'quickfix' }) end,
    vim.tbl_extend('force', opts, { desc = 'Code quickfix' }))

  -- LSP actions
  vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.rename() end,
    vim.tbl_extend('force', opts, { desc = 'Code rename' }))
  vim.keymap.set({ 'n', 'x' }, '<leader>ca', function() vim.lsp.buf.code_action() end,
    vim.tbl_extend('force', opts, { desc = 'Code action' }))
  vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format() end,
    vim.tbl_extend('force', opts, { desc = 'Code format' }))

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.MiniCompletion.completefunc_lsp')

  if vim.lsp.formatexpr then
    vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr')
  end

  if vim.lsp.tagfunc then
    vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
  end

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end

  vim.diagnostic.config({
    virtual_text = {
      enabled = false,
      set_category = 'end_of_line',
      prefix = ' ',               -- Add a space before the diagnostic message
    },
    signs = true,             -- Show signs in the sign column
    underline = true,         -- Underline problematic text
    update_in_insert = false, -- Don't update diagnostics in insert mode (can be distracting)
    severity_sort = true,     -- Sort diagnostics by severity
    float = {                 -- Configuration for the floating diagnostic window
      border = 'rounded',
      source = 'if_many',     -- Shows source if there are multiple diagnostics for the line
    },
  })
end

local function lsp_on_detach(client, bufnr)
  local keymaps = {
    { 'n', '<leader>cg' },
    { 'n', '<leader>cR' },
    { 'n', '<leader>ci' },
    { 'n', '<leader>cD' },
    { 'n', '<leader>ct' },
    { 'n', '<leader>cs' },
    { 'n', '<leader>cd' },
    { 'n', '<leader>cq' },
    { 'n', '<leader>cr' },
    { 'n', '<leader>ca' },
    { 'x', '<leader>ca' },
    { 'n', '<leader>cf' },
  }

  for _, keymap in ipairs(keymaps) do
    pcall(vim.keymap.del, keymap[1], keymap[2], { buffer = bufnr })
  end
end

-- LSP attach/detach autocommands
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('attach_lsp', {}),
  callback = function(ev)
    lsp_on_attach(vim.lsp.get_client_by_id(ev.data.client_id), ev.buf)
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  group = vim.api.nvim_create_augroup('detach_lsp', {}),
  callback = function(ev)
    lsp_on_detach(vim.lsp.get_client_by_id(ev.data.client_id), ev.buf)
  end,
})

-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    require('vim.hl').on_yank({ timeout = 250 })
  end,
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
})

-- Set non-standard file types
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.abs',
  callback = function()
    vim.bo.filetype = 'abs'
  end,
})

-- Don't highlight words in neotree buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'Neo-Tree',
  callback = function()
    vim.b.minicursorword_disable = true
  end,
})
