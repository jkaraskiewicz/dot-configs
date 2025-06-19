return {
  'nvzone/timerly',
  dependencies = {
    {
      'nvzone/volt',
    },
  },
  cmd = { 'TimerlyToggle' },
  keys = {
    { '<leader>mT', ':TimerlyToggle<cr>', desc = 'Timerly' },
  },
  opts = {
    position = 'bottom-right',
  },
}
