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
        virtual_diagnostics = {
          enabled = true,
          key = 'v',
          values = {
            {
              desc = 'lines:all',
              value = 'all',
            },
            {
              desc = 'lines:current',
              value = 'current',
            },
            {
              desc = 'text',
              value = 'text',
            },
            {
              desc = 'off',
              value = 'off',
            },
          },
          toggle = function(value)
            local display_text = value == 'text'
            local display_lines = value == 'all' or value == 'current'
            local lines_config

            if not display_lines then
              lines_config = false
            elseif value == 'all' then
              lines_config = {
                current_line = false,
              }
            else
              lines_config = {
                current_line = true,
              }
            end

            vim.diagnostic.config({
              virtual_text = display_text,
              virtual_lines = lines_config,
            })
          end,
          desc = 'Virtual diagnostics',
        },
      },
    })
  end,
}
