local map = vim.keymap.set

-- Configuration constants
local COLOR_COLUMN_WIDTH = 80

-- Toggle relative line numbers
map('n', '<leader>tr', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
  local state = vim.wo.relativenumber and 'enabled' or 'disabled'
  vim.notify('Relative numbers ' .. state, vim.log.levels.INFO)
end, { desc = 'Toggle relative numbers' })

-- Toggle diagnostics globally
map('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  local state = vim.diagnostic.is_enabled() and 'enabled' or 'disabled'
  vim.notify('Diagnostics ' .. state, vim.log.levels.INFO)
end, { desc = 'Toggle diagnostics' })

-- Toggle color column at 80 characters
map('n', '<leader>tc', function()
  if vim.wo.colorcolumn == '' then
    vim.wo.colorcolumn = tostring(COLOR_COLUMN_WIDTH)
    vim.notify('Color column enabled', vim.log.levels.INFO)
  else
    vim.wo.colorcolumn = ''
    vim.notify('Color column disabled', vim.log.levels.INFO)
  end
end, { desc = 'Toggle color column' })

-- Toggle inlay hints (LSP type annotations, parameter names, etc.)
map('n', '<leader>ti', function()
  local current_state = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
  vim.lsp.inlay_hint.enable(not current_state, { bufnr = 0 })
  local state_text = current_state and 'disabled' or 'enabled'
  vim.notify('Inlay hints ' .. state_text, vim.log.levels.INFO)
end, { desc = 'Toggle inlay hints' })
