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
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = { query = '@method.outer', desc = 'Next function' },
            [']c'] = { query = '@call.*', desc = 'Next call' },
            [']a'] = { query = '@parameter.inner', desc = 'Next argument' },
          },
          goto_previous_start = {
            ['[m'] = { query = '@method.outer', desc = 'Previous function' },
            ['[c'] = { query = '@call.*', desc = 'Previous call' },
            ['[a'] = { query = '@parameter.inner', desc = 'Previous argument' },
          },
          goto_next_end = {
            ['}m'] = { query = '@method.outer', desc = 'Next function' },
            ['}c'] = { query = '@call.*', desc = 'Next call' },
            ['}a'] = { query = '@parameter.inner', desc = 'Next argument' },
          },
          goto_previous_end = {
            ['{m'] = { query = '@method.outer', desc = 'Previous function' },
            ['{c'] = { query = '@call.*', desc = 'Previous call' },
            ['{a'] = { query = '@parameter.inner', desc = 'Previous argument' },
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
