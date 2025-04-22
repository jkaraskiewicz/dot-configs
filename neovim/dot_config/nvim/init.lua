-- Set leader key BEFORE loading plugins or keymaps
vim.g.mapleader = ','

-- Load core settings
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Bootstrap mini.deps (must be run AFTER cloning it manually)
require('mini.deps').setup({ path = { start = 'deps' } }) -- Tell mini.deps where it lives

-- Load plugin specifications
require('plugins')

-- Load plugin configurations AFTER plugins have been potentially installed by mini.deps
-- You could loop through files in lua/plugins/config/ or require them manually
-- For simplicity here, we'll require them manually after 'plugins' ensures they exist.
-- A more robust setup might load configs lazily or based on `mini.deps` hooks.

-- Mini plugins
pcall(require, 'plugins.config.mini-ai')
pcall(require, 'plugins.config.mini-animate')
pcall(require, 'plugins.config.mini-clue')
pcall(require, 'plugins.config.mini-comment')
pcall(require, 'plugins.config.mini-completion')
pcall(require, 'plugins.config.mini-extra')
pcall(require, 'plugins.config.mini-jump')
pcall(require, 'plugins.config.mini-move')
pcall(require, 'plugins.config.mini-pairs')
pcall(require, 'plugins.config.mini-pick')
pcall(require, 'plugins.config.mini-sessions')
pcall(require, 'plugins.config.mini-splitjoin')
pcall(require, 'plugins.config.mini-starter')
pcall(require, 'plugins.config.mini-statusline')
pcall(require, 'plugins.config.mini-surround')
pcall(require, 'plugins.config.mini-trailspace')

-- Other plugins
pcall(require, 'plugins.config.arrow')
pcall(require, 'plugins.config.colorscheme')
pcall(require, 'plugins.config.leap')
pcall(require, 'plugins.config.mason')
pcall(require, 'plugins.config.muren')
pcall(require, 'plugins.config.neotree')
pcall(require, 'plugins.config.neowords')
pcall(require, 'plugins.config.nvim-treesitter-textobjects')
pcall(require, 'plugins.config.nvim-various-textobjs')
pcall(require, 'plugins.config.osc52')
pcall(require, 'plugins.config.rip-substitute')
pcall(require, 'plugins.config.vim-expand-region')

-- Load LSP configs
require('plugins.config.lsp.angular')
require('plugins.config.lsp.java')
require('plugins.config.lsp.json')
require('plugins.config.lsp.kotlin')
require('plugins.config.lsp.lua')
require('plugins.config.lsp.rust')
require('plugins.config.lsp.typescript')
require('plugins.config.lsp.yaml')
