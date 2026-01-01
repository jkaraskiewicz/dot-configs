local opt = vim.opt

-- =============================================================================
-- APPEARANCE
-- =============================================================================
opt.termguicolors = true -- Enable true color support
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.signcolumn = 'yes' -- Always show the sign column
opt.scrolloff = 12 -- Keep 12 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor
opt.list = true -- Show invisible characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- How to show invisible characters
opt.cursorline = true -- Highlight the current line
opt.cmdheight = 0 -- Set to 0 to hide the command line (for messages)

-- =============================================================================
-- BEHAVIOR
-- =============================================================================
opt.mouse = 'a'                                   -- Enable mouse support in all modes
opt.clipboard = 'unnamedplus'                     -- Use system clipboard
opt.ignorecase = true                             -- Ignore case when searching
opt.smartcase = true                              -- Override ignorecase if search pattern has uppercase letters
opt.splitright = true                             -- Open vertical splits to the right
opt.splitbelow = true                             -- Open horizontal splits below
opt.wrap = false                                  -- Don't wrap lines
opt.linebreak = true                              -- Wrap lines at convenient points if wrap is on
opt.hidden = true                                 -- Allow hidden buffers
opt.completeopt = 'menuone,noselect,fuzzy,nosort' -- Fuzzy match in the completion window

-- =============================================================================
-- INDENTATION
-- =============================================================================
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2      -- Number of spaces a tab counts for
opt.softtabstop = 2  -- Number of spaces to insert when pressing Tab
opt.shiftwidth = 2   -- Number of spaces for auto-indent

-- =============================================================================
-- FILES AND BACKUP
-- =============================================================================
opt.swapfile = false -- Don't use swap files
opt.backup = false   -- Don't create backup files
opt.undofile = true  -- Enable persistent undo

-- Ensure undo directory exists
local undodir_path = vim.fn.stdpath('data') .. '/undodir'
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, 'p')
end
opt.undodir = undodir_path

-- =============================================================================
-- PERFORMANCE
-- =============================================================================
opt.updatetime = 250 -- Update time for CursorHold events (balanced for performance)
opt.timeoutlen = 300 -- Lower timeout for key sequences

-- =============================================================================
-- SMOOTH SCROLLING
-- =============================================================================
opt.smoothscroll = true -- Enable native smooth scrolling (Neovim 0.10+)

-- =============================================================================
-- SESSIONS
-- =============================================================================
opt.sessionoptions:remove('blank') -- Don't save blank buffers (like Neo-tree)

-- =============================================================================
-- CLIPBOARD
-- =============================================================================
if vim.env.TMUX ~= nil then
  vim.g.clipboard = 'tmux'
end

-- =============================================================================
-- TREESITTER WORKAROUND
-- =============================================================================
-- Fix syntax highlighting flickering issue
-- See: https://github.com/neovim/neovim/issues/32660
vim.g._ts_force_sync_parsing = true

-- =============================================================================
-- DIAGNOSTIC CONFIGURATION
-- =============================================================================
vim.diagnostic.config({
  virtual_text = true,      -- Enabled
  signs = true,             -- Show signs in the sign column
  underline = true,         -- Underline problematic text
  update_in_insert = false, -- Don't update diagnostics in insert mode (can be distracting)
  severity_sort = true,     -- Sort diagnostics by severity
  float = {                 -- Configuration for the floating diagnostic window
    border = 'rounded',
    source = 'if_many',     -- Shows source if there are multiple diagnostics for the line
  },
})
