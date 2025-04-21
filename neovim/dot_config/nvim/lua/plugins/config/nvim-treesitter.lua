-- Treesitter

local status_ok, ts = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  print('nvim-treesitter not found')
  return
end

ts.setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    'c',
    'lua',
    'rust',
    'python',
    'javascript',
    'typescript',
    'html',
    'css',
    'json',
    'yaml',
    'markdown',
    'markdown_inline',
    'bash',
    'java',
    'kotlin',
    'scheme',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true, -- Enable syntax highlighting
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false, -- Enable based on treesitter indent (may conflict with other indent plugins/settings)
  },
  -- Other modules can be enabled here, e.g., incremental selection, textobjects
})
