return {
  'markgandolfo/lightswitch.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('lightswitch').setup {
      toggles = {
        {
          name = 'Relative line numbers',
          enable_cmd =
            [[ :lua for _, winid in ipairs(vim.api.nvim_list_wins()) do ]] ..
            [[ if vim.api.nvim_get_option_value('number', {win = winid}) then ]] ..
            [[ vim.api.nvim_set_option_value('relativenumber', true, {win = winid}) ]] ..
            [[ end end<CR> ]]
          ,
          disable_cmd =
            [[ :lua for _, winid in ipairs(vim.api.nvim_list_wins()) do ]] ..
            [[ if vim.api.nvim_get_option_value('number', {win = winid}) then ]] ..
            [[ vim.api.nvim_set_option_value('relativenumber', false, {win = winid}) ]] ..
            [[ end end<CR> ]]
          ,
          state = true,
        },
      },
    }
  end,
  keys = {
    { '<leader>ml', ':LightSwitchShow<cr>', desc = 'LightSwitch toggles' },
  },
}
