return {
  'echasnovski/mini.snippets',
  version = false,
  dependencies = { 'rafamadriz/friendly-snippets' }, -- Pre-made snippet collection
  event = 'InsertEnter',
  config = function()
    local gen_loader = require('mini.snippets').gen_loader
    require('mini.snippets').setup({
      snippets = {
        -- Load friendly-snippets based on current buffer's language
        -- Automatically finds snippets in 'snippets/' directories in runtimepath
        -- Includes snippets for: Rust, TypeScript, JavaScript, Lua, and many more
        gen_loader.from_lang(),
      },
      mappings = {
        expand = '<C-j>',    -- Expand snippet or jump to next tabstop
        jump_next = '<C-l>', -- Jump to next tabstop
        jump_prev = '<C-h>', -- Jump to previous tabstop
        stop = '<ESC>',      -- Stop snippet session
      },
    })

    -- Enable LSP server integration
    -- This makes snippets available through LSP protocol, working seamlessly
    -- with mini.completion (which already ranks snippets highly)
    require('mini.snippets').start_lsp_server()
  end,
}
