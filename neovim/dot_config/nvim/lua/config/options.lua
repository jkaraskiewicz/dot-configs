local opt = vim.opt -- Use local variable for brevity
local o = vim.o     -- Use local variable for brevity

-- ## Appearance ##
opt.termguicolors = true -- Enable true color support
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.signcolumn = 'yes' -- Always show the sign column
opt.scrolloff = 12 -- Keep 12 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor
opt.list = true -- Show invisible characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- How to show invisible characters
opt.cursorline = true -- Highlight the current line
opt.colorcolumn = '80'
opt.cmdheight = 0 -- hide command line

-- ## Behavior ##
opt.mouse = 'a'                                 -- Enable mouse support in all modes
opt.clipboard = 'unnamedplus'                   -- Use system clipboard
opt.ignorecase = true                           -- Ignore case when searching
opt.smartcase = true                            -- Override ignorecase if search pattern has uppercase letters
opt.splitright = true                           -- Open vertical splits to the right
opt.splitbelow = true                           -- Open horizontal splits below
opt.wrap = false                                -- Don't wrap lines
opt.linebreak = true                            -- Wrap lines at convenient points if wrap is on
o.hidden = true                                 -- Reuse a terminal session
o.completeopt = 'menuone,noselect,fuzzy,nosort' -- Fuzzy match in the completion window

-- ## Indentation ##
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2      -- Number of spaces a tab counts for
opt.softtabstop = 2  -- Number of spaces to insert when pressing Tab
opt.shiftwidth = 2   -- Number of spaces for auto-indent

-- ## Files and Backup ##
opt.swapfile = false -- Don't use swap files
opt.backup = false   -- Don't create backup files
opt.undofile = true  -- Enable persistent undo

-- Define the undo directory path in a local variable first
local undodir_path = vim.fn.stdpath('data') .. '/undodir'

-- Ensure undo directory exists using the local variable
-- Check if the path (string) points to a directory (returns 1 if it is, 0 otherwise)
if vim.fn.isdirectory(undodir_path) == 0 then
  -- If directory doesn't exist, create it recursively
  print('Creating undo directory: ' .. undodir_path) -- Optional: for confirmation
  vim.fn.mkdir(undodir_path, 'p')                    -- 'p' creates parent directories as needed
end

-- Now, assign the verified path string to the Neovim option
opt.undodir = undodir_path

-- ## Performance ##
opt.updatetime = 100 -- Faster update time for CursorHold events (useful for plugins)
opt.timeoutlen = 300 -- Lower timeout for key sequences

-- ## Sessions ##
opt.sessionoptions:remove('blank') -- Don't save blank buffers (like Neo-tree)

-- ## Clipboard ##
if vim.env.TMUX ~= nil then
  vim.g.clipboard = 'tmux'
end

-- ## Fix the issue with treesitter syntax highlighting flickering ##
-- (https://github.com/neovim/neovim/issues/32660)
vim.g._ts_force_sync_parsing = true
