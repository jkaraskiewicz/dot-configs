return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.abs = {
      install_info = {
        url = 'https://github.com/jkaraskiewicz/tree-sitter-abs',
        files = { 'src/parser.c' },
        branch = 'master',
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
    }

    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'abs',
        'angular',
        'bash',
        'css',        -- Stylesheets
        'dockerfile', -- Dockerfiles
        'html',
        'java',
        'javascript',
        'json',
        'kotlin',
        'lua',
        'markdown',
        'proto',
        'python',
        'rust',
        'scheme',
        'textproto',
        'toml',       -- Cargo.toml, config files
        'typescript',
        'vim',
        'yaml',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          scope_incremental = '<Tab>',
          node_decremental = '<BS>',
        },
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = { query = '@function.outer', desc = 'Next function' },
            [']c'] = { query = '@call.outer', desc = 'Next call' },
            [']b'] = { query = '@block.outer', desc = 'Next block' },
            [']r'] = { query = '@return.outer', desc = 'Next return' },
            [']i'] = { query = '@impl.outer', desc = 'Next impl' },
            [']s'] = { query = '@struct.outer', desc = 'Next struct' },
            [']t'] = { query = '@trait.outer', desc = 'Next trait' },
          },
          goto_previous_start = {
            ['[m'] = { query = '@function.outer', desc = 'Previous function' },
            ['[c'] = { query = '@call.outer', desc = 'Previous call' },
            ['[b'] = { query = '@block.outer', desc = 'Previous block' },
            ['[r'] = { query = '@return.outer', desc = 'Previous return' },
            ['[i'] = { query = '@impl.outer', desc = 'Previous impl' },
            ['[s'] = { query = '@struct.outer', desc = 'Previous struct' },
            ['[t'] = { query = '@trait.outer', desc = 'Previous trait' },
          },
          goto_next_end = {
            ['}m'] = { query = '@function.outer', desc = 'Next function end' },
            ['}c'] = { query = '@call.outer', desc = 'Next call end' },
          },
          goto_previous_end = {
            ['{m'] = { query = '@function.outer', desc = 'Previous function end' },
            ['{c'] = { query = '@call.outer', desc = 'Previous call end' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            [']a'] = { query = '@parameter.inner', desc = 'Swap argument with next' },
          },
          swap_previous = {
            ['[a'] = { query = '@parameter.inner', desc = 'Swap argument with previous' },
          },
        },
      },
    })

    local repeatable_move = require('nvim-treesitter.textobjects.repeatable_move')

    vim.keymap.set({ 'n', 'x', 'o' }, ']]', repeatable_move.repeat_last_move_next,
      { noremap = true, silent = true, desc = 'Repeat last next move' })

    vim.keymap.set({ 'n', 'x', 'o' }, '[[', repeatable_move.repeat_last_move_previous,
      { noremap = true, silent = true, desc = 'Repeat last previous move' })
  end,
}
