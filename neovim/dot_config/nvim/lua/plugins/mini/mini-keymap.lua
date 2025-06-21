return {
  'echasnovski/mini.keymap',
  version = false,
  event = 'VeryLazy',
  config = function()
    local mini_keymap = require('mini.keymap')
    mini_keymap.setup()

    local map_multistep = mini_keymap.map_multistep
    map_multistep('i', '<Tab>', { 'pmenu_accept' })
  end,
}
