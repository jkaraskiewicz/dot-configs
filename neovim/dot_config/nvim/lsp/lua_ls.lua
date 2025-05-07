return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      hint = {
        enable = true,
      },
      format = {
        enable = true,
        defaultConfig = {
          quote_style = 'single',
          max_line_length = '120',
          indent_style = 'space',
          indent_size = '2',
          trailing_table_separator = 'smart',
        },
      },
    },
  },
}
