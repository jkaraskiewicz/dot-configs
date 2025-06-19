return {
  'akinsho/toggleterm.nvim',
  version = false,
  cmd = { 'ToggleTerm', 'TermExec', 'TermNew', 'TermSelect' },
  config = true,
  keys = {
    { '<leader>mt', ':ToggleTerm<cr>', desc = 'Terminal' },
  },
}
