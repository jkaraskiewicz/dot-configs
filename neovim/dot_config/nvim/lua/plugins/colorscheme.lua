return {
  'jkaraskiewicz/colorscheme-picker.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('colorscheme-picker').setup({
      themes = {
        'Abstract-IDE/Abstract-cs',
        'ashish2508/Eezzy.nvim',
        'bdesham/biogoo',
        'bluz71/vim-moonfly-colors',
        'crusoexia/vim-monokai',
        {
          'datsfilipe/vesper.nvim',
          before = function()
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
        'DeviusVim/deviuspro.nvim',
        'doums/darcula',
        'evgenyzinoviev/vim-vendetta',
        'ficcdaf/ashen.nvim',
        'jalvesaq/southernlights',
        'katawful/kat.nvim',
        'kepano/flexoki',
        'Mofiqul/dracula.nvim',
        'Mofiqul/vscode.nvim',
        'morhetz/gruvbox',
        'nxvu699134/vn-night.nvim',
        'pmouraguedes/neodarcula.nvim',
        'rebelot/kanagawa.nvim',
        'rose-pine/neovim',
        'sam4llis/nvim-tundra',
        'savq/melange-nvim',
        'strange/strange.vim',
        'TaurusOlson/creature.vim',
        'tiesen243/vercel.nvim',
        'Verf/deepwhite.nvim',
        'vim-scripts/DarkZen-Color-Scheme',
        'xiantang/darcula-dark.nvim',
        'Yazeed1s/oh-lucy.nvim',
        -- 'blueshirts/darcula',
      },
      default = 'darcula-dark',
    })
  end,
  keys = {
    { '<leader>mc', ':ColorschemePickerOpen<cr>', desc = 'Color schemes' },
  },
}
