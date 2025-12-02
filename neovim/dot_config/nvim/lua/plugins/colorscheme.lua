-- Colorscheme picker plugin (replaces themify.nvim to fix memory leaks)
return {
  'jkaraskiewicz/colorscheme-picker.nvim',
  lazy = false,
  priority = 1000,
  config = {
    'Abstract-IDE/Abstract-cs',
    'DeviusVim/deviuspro.nvim',
    'Mofiqul/dracula.nvim',
    'Mofiqul/vscode.nvim',
    'TaurusOlson/creature.vim',
    'Yazeed1s/oh-lucy.nvim',
    'Verf/deepwhite.nvim',
    'ashish2508/Eezzy.nvim',
    'bdesham/biogoo',
    -- 'blueshirts/darcula',
    'bluz71/vim-moonfly-colors',
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
    'doums/darcula',
    'evgenyzinoviev/vim-vendetta',
    'ficcdaf/ashen.nvim',
    'jalvesaq/southernlights',
    'katawful/kat.nvim',
    'kepano/flexoki',
    'nxvu699134/vn-night.nvim',
    'pmouraguedes/neodarcula.nvim',
    'sam4llis/nvim-tundra',
    'savq/melange-nvim',
    'strange/strange.vim',
    'tiesen243/vercel.nvim',
    'vim-scripts/DarkZen-Color-Scheme',
    -- 'xiantang/darcula-dark.nvim',

    default = 'darcula',
  },
  keys = {
    { '<leader>mc', ':ColorschemePickerOpen<cr>', desc = 'Color schemes' },
  },
}
