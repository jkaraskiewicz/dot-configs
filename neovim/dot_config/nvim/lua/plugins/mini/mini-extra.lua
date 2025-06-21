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
        local width = math.floor(0.618 * vim.o.columns)
        local height = 5
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
      '<leader>fog',
      function() require('mini.extra').pickers.git_hunks() end,
      desc = 'Git hunks',
    },
    {
      '<leader>foj',
      function() require('mini.extra').pickers.list({ scope = 'jump' }) end,
      desc = 'Jumps',
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
  },
  config = function()
    require('mini.extra').setup()
  end,
}
