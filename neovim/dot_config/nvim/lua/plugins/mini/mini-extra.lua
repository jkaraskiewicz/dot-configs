return {
  'echasnovski/mini.extra',
  version = false,
  keys = {
    {
      '<leader>ft',
      function() require('mini.extra').pickers.treesitter() end,
      desc = 'Find in treesitter nodes',
    },
    {
      '<leader>fv',
      function() require('mini.extra').pickers.visit_paths() end,
      desc = 'Find in recent',
    },
    {
      '<leader>fr',
      function() require('mini.extra').pickers.registers() end,
      desc = 'Find in registers',
    },
    {
      '<leader>fk',
      function() require('mini.extra').pickers.keymaps() end,
      desc = 'Find in keymaps',
    },
    {
      '<leader>fh',
      function() require('mini.extra').pickers.history() end,
      desc = 'Find in history',
    },
    {
      '<leader>fc',
      function() require('mini.extra').pickers.commands() end,
      desc = 'Find in commands',
    },
    {
      '<leader>fo',
      function() require('mini.extra').pickers.options() end,
      desc = 'Find in neovim options',
    },
    {
      '<leader>fl',
      function() require('mini.extra').pickers.buf_lines({ scope = 'current' }) end,
      desc = 'Find in current buffer',
    },
  },
  config = function()
    require('mini.extra').setup()
  end,
}
