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
    -- Subword text objects (camelCase/snake_case aware)
    { 'aw', '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { 'o', 'x' }, desc = 'Around subword' },
    { 'iw', '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { 'o', 'x' }, desc = 'Inner subword' },
  },
}
