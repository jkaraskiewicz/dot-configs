-- Extra mini.nvim stuff - pickers etc.

MiniDeps.later(
  function()
    local status_ok, mini_extra = pcall(require, 'mini.extra')
    if not status_ok then
      print('mini.extra not found')
      return
    end

    mini_extra.setup()

    vim.keymap.set('n', '<leader>fl', function() mini_extra.pickers.buf_lines({ scope = 'current' }) end,
      { noremap = true, silent = true, desc = 'Find in current buffer' })

    vim.keymap.set('n', '<leader>fc', function() mini_extra.pickers.commands() end,
      { noremap = true, silent = true, desc = 'Find in commands' })

    vim.keymap.set('n', '<leader>fh', function() mini_extra.pickers.history() end,
      { noremap = true, silent = true, desc = 'Find in history' })

    vim.keymap.set('n', '<leader>fk', function() mini_extra.pickers.keymaps() end,
      { noremap = true, silent = true, desc = 'Find in keymaps' })

    vim.keymap.set('n', '<leader>fr', function() mini_extra.pickers.registers() end,
      { noremap = true, silent = true, desc = 'Find in registers' })

    vim.keymap.set('n', '<leader>ft', function() mini_extra.pickers.treesitter() end,
      { noremap = true, silent = true, desc = 'Find in treesitter nodes' })
  end
)
