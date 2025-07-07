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
        color_column = {
          enabled = true,
          key = 'C',
          values = { '', '80' },
          toggle = function(value)
            vim.opt.colorcolumn = value
          end,
          desc = 'Color column',
        },
      },
    })
  end,
}
