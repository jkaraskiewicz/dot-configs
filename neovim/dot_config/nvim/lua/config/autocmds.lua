local function lsp_on_attach(client, bufnr)
  -- Setup keymaps and other buffer-local settings
  vim.keymap.set('n', 'grd', function() require('mini.extra').pickers.lsp({ scope = 'definition' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Definition',
    })
  vim.keymap.set('n', 'grr', function() require('mini.extra').pickers.lsp({ scope = 'references' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'References',
    })
  vim.keymap.set('n', 'gri', function() require('mini.extra').pickers.lsp({ scope = 'implementation' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Implementation',
    })
  vim.keymap.set('n', 'grs', function() require('mini.extra').pickers.lsp({ scope = 'document_symbol' }) end,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Document symbol',
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
end

local function lsp_on_detach(client, bufnr)
  pcall(vim.keymap.del, 'n', 'grd')
  pcall(vim.keymap.del, 'n', 'grr')
  pcall(vim.keymap.del, 'n', 'gri')
  pcall(vim.keymap.del, 'n', 'grs')
end

-- Create the Autocommand to call the on_attach function
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('attach_lsp', {}),
  -- Use the function defined above as the callback
  callback = function(ev)
    -- You could add logic here to check ev.data.client_id if needed
    -- or just call the general on_attach for all servers
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
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '*.abs',
  callback = function()
    vim.bo.filetype = 'abs'
  end
})
