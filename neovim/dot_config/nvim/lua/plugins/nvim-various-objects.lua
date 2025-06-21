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
    -- Small words
    { 'aw', '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { 'o', 'x' } },
    { 'iw', '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { 'o', 'x' } },
    -- Entire line without the last character
    { 'n',  '<cmd>lua require("various-textobjs").nearEoL()<CR>',        mode = { 'o', 'x' } },
  },
}
