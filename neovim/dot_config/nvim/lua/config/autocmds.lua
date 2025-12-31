-- Configuration constants
local CODELENS_DEBOUNCE_MS = 500
local YANK_HIGHLIGHT_MS = 250

-- =============================================================================
-- DIAGNOSTIC CONFIGURATION (Global - runs once)
-- =============================================================================
-- Note: Diagnostics can be toggled on/off globally with <leader>td
-- This config controls HOW diagnostics are displayed when enabled
vim.diagnostic.config({
  virtual_text = false,     -- Disabled (signs/underlines are enough)
  signs = true,             -- Show signs in the sign column
  underline = true,         -- Underline problematic text
  update_in_insert = false, -- Don't update diagnostics in insert mode (can be distracting)
  severity_sort = true,     -- Sort diagnostics by severity
  float = {                 -- Configuration for the floating diagnostic window
    border = 'rounded',
    source = 'if_many',     -- Shows source if there are multiple diagnostics for the line
  },
})

-- =============================================================================
-- LSP KEYBINDS (Buffer-local - set on LspAttach)
-- =============================================================================
-- Keybind strategy:
--   1. Direct navigation (g*) - Quick jumps to single locations (keymaps.lua)
--      - gd (definition), gr (references), gI (implementation), etc.
--   2. Picker navigation (<leader>c*) - Browse multiple results with preview
--      - <leader>cg (definition), <leader>cR (references), etc.
--
-- Both approaches are available - use direct for speed, picker for exploration
local LSP_KEYBINDS = {
  -- Navigation pickers
  { 'n', '<leader>cg', function() require('mini.extra').pickers.lsp({ scope = 'definition' }) end,      'Code go to definition' },
  { 'n', '<leader>cR', function() require('mini.extra').pickers.lsp({ scope = 'references' }) end,      'Code references' },
  { 'n', '<leader>ci', function() require('mini.extra').pickers.lsp({ scope = 'implementation' }) end,  'Code implementation' },
  { 'n', '<leader>cD', function() require('mini.extra').pickers.lsp({ scope = 'declaration' }) end,     'Code declaration' },
  { 'n', '<leader>ct', function() require('mini.extra').pickers.lsp({ scope = 'type_definition' }) end, 'Code type definition' },

  -- Utility pickers
  { 'n', '<leader>cs', function() require('mini.extra').pickers.lsp({ scope = 'document_symbol' }) end, 'Code symbols' },
  { 'n', '<leader>cd', function() require('mini.extra').pickers.diagnostic({ scope = 'current' }) end,  'Code diagnostics' },
  { 'n', '<leader>cq', function() require('mini.extra').pickers.list({ scope = 'quickfix' }) end,       'Code quickfix' },

  -- Actions
  { 'n', '<leader>cr', function() vim.lsp.buf.rename() end,                                             'Code rename' },
  { 'n', '<leader>ca', function() vim.lsp.buf.code_action() end,                                        'Code action' },
  { 'x', '<leader>ca', function() vim.lsp.buf.code_action() end,                                        'Code action' },
  { 'n', '<leader>cf', function() vim.lsp.buf.format() end,                                             'Code format' },
}

local function lsp_on_attach(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

  -- Set all LSP keybinds from the shared table
  for _, bind in ipairs(LSP_KEYBINDS) do
    local mode, lhs, rhs, desc = bind[1], bind[2], bind[3], bind[4]
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', opts, { desc = desc }))
  end

  -- Set buffer-local LSP options
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.MiniCompletion.completefunc_lsp', { buf = bufnr })

  if vim.lsp.formatexpr then
    vim.api.nvim_set_option_value('formatexpr', 'v:lua.vim.lsp.formatexpr', { buf = bufnr })
  end

  if vim.lsp.tagfunc then
    vim.api.nvim_set_option_value('tagfunc', 'v:lua.vim.lsp.tagfunc', { buf = bufnr })
  end

  -- Enable inlay hints if supported (type annotations, parameter names, etc.)
  if client.server_capabilities.inlayHintProvider then
    local ok = pcall(vim.lsp.inlay_hint.enable, true)
    if not ok then
      vim.notify('Failed to enable inlay hints', vim.log.levels.WARN)
    end
  end

  -- Enable code lens (shows "Run Test" buttons, reference counts, etc.)
  -- Supported by: rust-analyzer, ts_ls, jdtls
  if client.server_capabilities.codeLensProvider then
    -- Initial refresh (deferred to avoid blocking LSP attach)
    vim.schedule(function()
      local ok = pcall(vim.lsp.codelens.refresh, { bufnr = bufnr })
      if not ok then
        vim.notify('Failed to refresh code lens', vim.log.levels.WARN)
      end
    end)

    -- Debounced refresh to prevent hammering the LSP server
    local codelens_timer = nil
    local function refresh_codelens_debounced()
      if codelens_timer then
        vim.fn.timer_stop(codelens_timer)
      end
      codelens_timer = vim.fn.timer_start(CODELENS_DEBOUNCE_MS, function()
        pcall(vim.lsp.codelens.refresh, { bufnr = bufnr })
        codelens_timer = nil
      end)
    end

    -- Auto-refresh on specific events
    vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('lsp_codelens_' .. bufnr, { clear = true }),
      buffer = bufnr,
      callback = refresh_codelens_debounced,
    })
  end
end

local function lsp_on_detach(client, bufnr)
  -- Clean up all LSP keybinds from the shared table
  for _, bind in ipairs(LSP_KEYBINDS) do
    local mode, lhs = bind[1], bind[2]
    pcall(vim.keymap.del, mode, lhs, { buffer = bufnr })
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

-- =============================================================================
-- OTHER AUTOCOMMANDS
-- =============================================================================

-- Highlight yank (brief visual feedback when yanking text)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = YANK_HIGHLIGHT_MS })
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

-- Show mini.clue window in special buffers
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('MiniClueTriggers', { clear = true }),
  pattern = { 'neo-tree', 'toggleterm', 'codecompanion' },
  callback = function()
    require('mini.clue').ensure_buf_triggers()
  end,
})
