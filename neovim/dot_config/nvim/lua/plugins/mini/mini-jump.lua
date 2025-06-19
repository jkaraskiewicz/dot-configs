return {
  'echasnovski/mini.jump',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.jump').setup({
      mappings = {
        repeat_jump = '',
      },
    })
  end,
}
