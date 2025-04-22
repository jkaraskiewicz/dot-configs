local add = require('mini.deps').add

-- Add plugins here
add('echasnovski/mini.nvim') -- Base plugin (needed for modules)

-- === Mini Modules ===
-- Completion: Simple completion engine
add('echasnovski/mini.completion')

-- Comment: Easy commenting (`gc`, `gcc`)
add('echasnovski/mini.comment')

-- Pairs: Auto-close pairs like (), [], {}
add('echasnovski/mini.pairs')

-- Statusline: Minimalist status line
add('echasnovski/mini.statusline')

-- Animate: animated cursor/window movements
add('echasnovski/mini.animate')

-- Jump: better F, f, T, t
add('echasnovski/mini.jump')

-- Move: Move selection in any direction
add('echasnovski/mini.move')

-- Pick: Select a file, buffer, etc.
add('echasnovski/mini.pick')

-- Clue: Mini which-key
add('echasnovski/mini.clue')

-- Starter: Startup screen
add('echasnovski/mini.starter')

-- A/I: Enhanced a/i textobjects
add('echasnovski/mini.ai')

-- Sessions: Manage multiple sessions
add('echasnovski/mini.sessions')

-- Splitjoin: Split/join parameters
add('echasnovski/mini.splitjoin')

-- Surround: Manage surrounding brackets, quotes, etc.
add('echasnovski/mini.surround')

-- Extra: Additional extensions for other mini plugins
add('echasnovski/mini.extra')

-- Trailspace: Highlight/remove trailing white spaces
add('echasnovski/mini.trailspace')

-- === Other plugins ===

-- Treesitter: Better syntax highlighting & parsing
add({ source = 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' })

-- Colorcheme: darcula-dark
add({
  source = 'xiantang/darcula-dark.nvim',
  depends = {
    'nvim-treesitter/nvim-treesitter',
  },
})

-- Neo-tree
add({
  source = 'nvim-neo-tree/neo-tree.nvim',
  depends = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  checkout = 'v3.x',
})

-- mason (for LSPs)
add('williamboman/mason.nvim')

-- OSC52 - Shared clipboard
add('ojroques/nvim-osc52')

-- nvim-various-textobjects
add('chrisgrieser/nvim-various-textobjs')

-- muren (multiple search & replace)
add('AckslD/muren.nvim')

-- rip-substitute
add('chrisgrieser/nvim-rip-substitute')

-- arrow
add('otavioschwanck/arrow.nvim')

-- vim-expand-region
add('terryma/vim-expand-region')

-- leap.nvim
add('ggandor/leap.nvim')

-- neowords (overrides 'w', 'e', 'W', 'b' etc. to handle _, -, .)
add('backdround/neowords.nvim')

-- diffconflicts
add('whiteinge/diffconflicts')

-- Note: mini.deps will automatically detect these need to be installed/updated
-- on the next run or when you manually run :DepsUpdate
