return {
  'AndrewRadev/switch.vim',
  cmd = 'Switch',
  keys = {
    { 'gs', ':Switch<cr>', desc = 'Switch or cycle' },
  },
  init = function()
    vim.cmd([[
      let g:switch_mapping = ""
    ]])
  end,
}
