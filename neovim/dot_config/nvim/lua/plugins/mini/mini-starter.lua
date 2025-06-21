return {
  'echasnovski/mini.starter',
  version = false,
  config = function()
    local starter = require('mini.starter')
    starter.setup({
      items = {
        starter.sections.sessions(5, true),
        starter.sections.recent_files(5, false, false),
        { section = 'Tools', name = 'Lazy',  action = 'Lazy' },
        { section = 'Tools', name = 'Mason', action = 'Mason' },
        starter.sections.builtin_actions()
      },
    })
    vim.keymap.set(
      'n',
      '<leader>ms',
      function()
        vim.cmd [[Neotree close]]
        require('mini.starter').open()
      end,
      { noremap = true, silent = true, desc = 'Starter screen' }
    )
  end,
}
