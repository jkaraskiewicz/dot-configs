return {
  'chrisgrieser/nvim-rip-substitute',
  version = false,
  cmd = 'RipSubstitute',
  keys = {
    { '<leader>sr', function() require('rip-substitute').sub() end, mode = { 'n', 'x' }, desc = 'Replace in buffer' },
  },
}
