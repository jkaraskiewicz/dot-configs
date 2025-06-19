return {
  'AndrewRadev/switch.vim',
  version = false,
  cmd = 'Switch',
  keys = {
    { 'gs', ':Switch<cr>', desc = 'Switch or cycle word' },
  },
  init = function()
    vim.cmd([[
      let g:switch_mapping = ""
    ]])
  end,
}
