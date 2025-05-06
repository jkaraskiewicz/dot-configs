return {
  'AndrewRadev/switch.vim',
  cmd = 'Switch',
  keys = {
    { 'gs', ':Switch<cr>', desc = 'Switch/cycle' },
  },
  init = function()
    vim.cmd([[
      let g:switch_mapping = ""
    ]])
  end,
}
