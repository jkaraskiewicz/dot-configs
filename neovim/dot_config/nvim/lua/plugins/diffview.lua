return {
  'sindrets/diffview.nvim',
  keys = {
    {
      '<leader>dd',
      function()
        local lib = require('diffview.lib')
        local view = lib.get_current_view()
        if view then
          vim.cmd.DiffviewClose()
        else
          vim.cmd.DiffviewOpen()
        end
      end,
      desc = 'Toggle diffview',
    },
  },
  cmd = 'DiffviewOpen',
  config = function()
    require('diffview').setup({
      keymaps = {
        view = {
          { 'n', '<leader>dd', ':DiffviewClose<CR>', { desc = 'Close diffview' } },
        },
      },
    })
  end,
}
