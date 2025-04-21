local function lsp_on_attach(client, bufnr)
  print('LSP client attached: ' .. client.name)
  -- Setup keymaps and other buffer-local settings
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc = 'Go to definition',
    })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
    {
      buffer = bufnr,
      noremap = true,
      silent = true,
      desc =
      'Go to implementation',
    })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references,
    { buffer = bufnr, noremap = true, silent = true, desc = 'Go to references' })
  -- Add other setup like highlighting, etc.
end

-- Create the Autocommand to call the on_attach function
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  -- Use the function defined above as the callback
  callback = function(ev)
    -- You could add logic here to check ev.data.client_id if needed
    -- or just call the general on_attach for all servers
    lsp_on_attach(vim.lsp.get_client_by_id(ev.data.client_id), ev.buf)
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
