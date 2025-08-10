return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    require('oil').setup({
      default_file_explorer = false,
      columns = {
        'icon',
        'permissions',
        'size',
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 5,
      },
    })

    vim.keymap.set('n', '<leader>eo', '<cmd>Oil --float .<CR>',
      {
        noremap = true,
        silent = true,
        desc = 'Oil',
      })
  end,
}
