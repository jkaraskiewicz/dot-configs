return {
  'nvzone/timerly',
  dependencies = {
    {
      'nvzone/volt',
    },
  },
  cmd = { 'TimerlyToggle' },
  keys = {
    { '<leader>mT', ':TimerlyToggle<cr>', desc = 'Toggle timerly' },
  },
  opts = {
    position = 'bottom-right',
  },
}
