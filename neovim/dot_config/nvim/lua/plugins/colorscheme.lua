return {
  'lmantw/themify.nvim',
  lazy = false,
  priority = 1000,
  config = {
    'AlessandroYorba/Alduin',
    'EdenEast/nightfox.nvim',
    'HoNamDuong/hybrid.nvim',
    'Mofiqul/vscode.nvim',
    'NLKNguyen/papercolor-theme',
    'armannikoyan/rusty',
    'bdesham/biogoo',
    'bluz71/vim-moonfly-colors',
    'brafales/vim-desert256',
    'crusoexia/vim-monokai',
    {
      'datsfilipe/vesper.nvim',
      before = function(theme)
        require('vesper').setup({
          italics = {
            comments = false,
            keywords = false,
            functions = false,
            strings = false,
            variables = false,
          },
        })
      end,
    },
    'folke/tokyonight.nvim',
    'jacoborus/tender.vim',
    'kepano/flexoki',
    'logico/typewriter',
    'morhetz/gruvbox',
    'rebelot/kanagawa.nvim',
    'rockyzhang24/arctic.nvim',
    'sainnhe/gruvbox-material',
    'sainnhe/sonokai',
    'thesimonho/kanagawa-paper.nvim',
    'vim-scripts/DarkZen-Color-Scheme',
    'wesleimp/min-theme.nvim',
    'xiantang/darcula-dark.nvim',
  },
  keys = {
    { '<leader>mc', ':Themify<cr>', desc = 'Color schemes' },
  },
}
