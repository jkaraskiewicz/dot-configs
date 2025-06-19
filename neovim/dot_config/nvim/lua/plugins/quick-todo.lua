return {
  'SyedAsimShah1/quick-todo.nvim',
  config = function()
    require('quick-todo').setup({
      keys = {
        open = nil,
      },
    })
  end,
  keys = {
    {
      '<leader>mq',
      function() require('quick-todo').open_todo() end,
      mode = { 'n', 'x' },
      desc = 'Quick todo',
    },
  },
}
