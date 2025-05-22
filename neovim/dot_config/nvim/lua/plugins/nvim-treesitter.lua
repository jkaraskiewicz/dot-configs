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
    })
  end,
}
