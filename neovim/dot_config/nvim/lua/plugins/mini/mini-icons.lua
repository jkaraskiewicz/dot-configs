return {
  'nvim-mini/mini.icons',
  version = false,
  config = function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
    MiniIcons.tweak_lsp_kind()
  end,
}
