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
      let g:switch_custom_definitions = [
            \   {
            \     '\<[a-z0-9]\+_\k\+\>': {
            \       '_\(.\)': '\U\1'
            \     },
            \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
            \       '\([A-Z]\)': '_\l\1'
            \     },
            \   }
            \ ]
          ]])
  end,
}
