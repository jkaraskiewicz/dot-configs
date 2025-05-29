return {
  'echasnovski/mini.base16',
  version = false,
  enabled = false,
  config = function()
    require('mini.base16').setup({
      palette = {
        base00 = '#161616', -- background
        base01 = '#121212', -- color for current line background etc.
        base02 = '#121212', -- color for separators and status line sections
        base03 = '#515151', -- color for comments, arg names etc.
        base04 = '#515151', -- color for ignored files
        base05 = '#f2f2f2', -- color for file names
        base06 = '#f2f2f2', -- rarely used
        base07 = '#f2f2f2', -- rarely used
        base08 = '#f12509', -- color for variables and 'return'
        base09 = '#00f2ce', -- color for integers, booleans, constants
        base0A = '#f12509', -- color for modified files, classes
        base0B = '#f2f2f2', -- color for strings
        base0C = '#f2f2f2', -- color used for 'nil', escape characters, regex
        base0D = '#00f2ce', -- color for function calls (also directories)
        base0E = '#bedf00', -- color for keywords
        base0F = '#00f2ce', -- not sure
      },
      use_cterm = nil,
      plugins = { default = true },
    })
  end,
}
