local help_text = [[
# Quick guide
Empty now.
]]

vim.keymap.set(
  'n',
  '<leader>mh',
  function()
    require('utils.utils').open_buffer_with_content(help_text, 'markdown')
  end,
  { noremap = true, silent = true, desc = 'Show help' }
)
