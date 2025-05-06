return {
  'mbbill/undotree',
  config = function()
    vim.cmd [[let g:undotree_WindowLayout = 3]]
    vim.cmd [[let g:undotree_SplitWidth = 60]]
  end,
  keys = {
    { '<leader>mu', function() vim.cmd [[UndotreeToggle]] end, desc = 'Toggle undo tree' },
  },
}
