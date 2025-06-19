return {
  'echasnovski/mini.starter',
  version = false,
  config = function()
    require('mini.starter').setup()
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
