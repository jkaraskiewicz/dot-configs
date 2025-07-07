local function lsp_on_attach(client, bufnr)
  -- Setup keymaps and other buffer-local settings
  vim.keymap.set('n', '<leader>rd', function() require('mini.extra').pickers.lsp({ scope = 'definition' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Definition',
    })
  vim.keymap.set('n', '<leader>rr', function() require('mini.extra').pickers.lsp({ scope = 'references' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'References',
    })
  vim.keymap.set('n', '<leader>ri', function() require('mini.extra').pickers.lsp({ scope = 'implementation' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Implementation',
    })
  vim.keymap.set('n', '<leader>rs', function() require('mini.extra').pickers.lsp({ scope = 'document_symbol' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Document symbol',
    })
  vim.keymap.set('n', '<leader>rD', function() require('mini.extra').pickers.lsp({ scope = 'declaration' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Declaration',
    })
  vim.keymap.set('n', '<leader>rt', function() require('mini.extra').pickers.lsp({ scope = 'type_definition' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Type definition',
    })

  -- Formatting keymap (defaults to non-LSP version)
  if not vim.tbl_isempty(vim.lsp.get_clients()) then
    vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.format() end,
      { desc = 'Format buffer' })
  else
    vim.keymap.set('n', '<leader>rf', 'gg=G<C-o>', { desc = 'Format buffer' })
  end

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
  pcall(vim.keymap.del, 'n', '<leader>rd')
  pcall(vim.keymap.del, 'n', '<leader>rr')
  pcall(vim.keymap.del, 'n', '<leader>ri')
  pcall(vim.keymap.del, 'n', '<leader>rs')
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
