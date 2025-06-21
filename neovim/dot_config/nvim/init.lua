-- Set leader key BEFORE loading plugins or keymaps
vim.g.mapleader = ','

require('config.disabled-keymaps')
require('config.autocmds')
require('config.keymaps')
require('config.options')
require('config.lazy')

-- mini.completion vs nvim-cmp
