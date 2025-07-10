return {
  'jkaraskiewicz/toggle.nvim',
  dependencies = {
    'jkaraskiewicz/utils.nvim',
  },
  event = 'VeryLazy',
  config = function()
    require('toggle').setup({
      prefix = '<leader>t',
      toggles = {
        cursor_style = {
          enabled = false,
        },
      },
    })
  end,
}
