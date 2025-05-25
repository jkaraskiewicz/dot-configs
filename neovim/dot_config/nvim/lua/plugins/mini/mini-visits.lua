return {
  'echasnovski/mini.visits',
  version = false,
  config = function()
    require('mini.visits').setup({
      track = {
        event = 'BufEnter',
        delay = 200,
      },
    })
  end,
}
