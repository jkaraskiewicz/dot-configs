return {
  'chrisgrieser/nvim-various-textobjs',
  version = false,
  event = 'VeryLazy',
  opts = {
    keymaps = {
      useDefaults = false,
    },
  },
  keys = {
    { 'aw', '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { 'o', 'x' } },
    { 'iw', '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { 'o', 'x' } },
    { 'n',  '<cmd>lua require("various-textobjs").nearEoL()<CR>',        mode = { 'o', 'x' } },
  },
}
