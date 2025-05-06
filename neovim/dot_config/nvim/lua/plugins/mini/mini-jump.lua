return {
  'echasnovski/mini.jump',
  version = false,
  config = function()
    require('mini.jump').setup({
      mappings = {
        repeat_jump = '',
      },
    })
  end,
}
