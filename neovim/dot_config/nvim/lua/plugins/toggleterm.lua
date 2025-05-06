return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = { 'ToggleTerm', 'TermExec', 'TermNew', 'TermSelect' },
  config = true,
  keys = {
    { '<leader>mt', ':ToggleTerm<cr>', desc = 'Toggle terminal' },
  },
}
