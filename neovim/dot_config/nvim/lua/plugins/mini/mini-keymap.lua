return {
  'echasnovski/mini.keymap',
  version = false,
  config = function()
    require('mini.keymap').setup()

    local map_multistep = require('mini.keymap').map_multistep
    map_multistep('i', '<Tab>', { 'pmenu_accept' })
  end,
}
