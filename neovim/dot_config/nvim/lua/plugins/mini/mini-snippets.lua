return {
  'echasnovski/mini.snippets',
  version = false,
  dependencies = { 'rafamadriz/friendly-snippets' }, -- Pre-made snippet collection
  event = 'InsertEnter',
  config = function()
    local gen_loader = require('mini.snippets').gen_loader
    require('mini.snippets').setup({
      snippets = {
        -- Load friendly-snippets from runtimepath
        -- Includes snippets for: Rust, TypeScript, JavaScript, Lua, and many more
        gen_loader.from_runtime(),
      },
      mappings = {
        expand = '<Tab>',      -- Expand snippet or jump to next tabstop
        jump_next = '<Tab>',   -- Jump to next tabstop
        jump_prev = '<S-Tab>', -- Jump to previous tabstop
        stop = '<C-c>',        -- Stop snippet session
      },
    })

    -- Enable LSP server integration
    -- This makes snippets available through LSP protocol, working seamlessly
    -- with mini.completion (which already ranks snippets highly)
    require('mini.snippets').start_lsp_server()
  end,
}
