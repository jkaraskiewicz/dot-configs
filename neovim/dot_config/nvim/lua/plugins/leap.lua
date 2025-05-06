return {
  'ggandor/leap.nvim',
  keys = {
    { ';', '<Plug>(leap)', mode = { 'n', 'x', 'o' } },
  },
  init = function()
    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'Black', bg = 'White', bold = true })
  end,
}
