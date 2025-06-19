return {
  'echasnovski/mini.extra',
  version = false,
  keys = {
    {
      '<leader>fot',
      function() require('mini.extra').pickers.treesitter() end,
      desc = 'Treesitter nodes',
    },
    {
      '<leader>fv',
      function()
        require('mini.extra').pickers.visit_paths({
          recency_weight = 1,
        })
      end,
      desc = 'Recent files',
    },
    {
      '<leader>for',
      function() require('mini.extra').pickers.registers() end,
      desc = 'Registers',
    },
    {
      '<leader>fok',
      function() require('mini.extra').pickers.keymaps() end,
      desc = 'Keymaps',
    },
    {
      '<leader>fh',
      function() require('mini.extra').pickers.history() end,
      desc = 'Command history',
    },
    {
      '<leader>foc',
      function() require('mini.extra').pickers.commands() end,
      desc = 'Commands',
    },
    {
      '<leader>foo',
      function() require('mini.extra').pickers.options() end,
      desc = 'Options',
    },
    {
      '<leader>fc',
      function() require('mini.extra').pickers.buf_lines({ scope = 'current' }) end,
      desc = 'Current buffer content',
    },
  },
  config = function()
    require('mini.extra').setup()
  end,
}
