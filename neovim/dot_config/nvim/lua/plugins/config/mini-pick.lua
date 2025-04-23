-- Picker from mini.nvim

MiniDeps.later(
  function()
    local status_ok, mini_pick = pcall(require, 'mini.pick')
    if not status_ok then
      print('mini.pick not found')
      return
    end

    mini_pick.setup()

    vim.keymap.set('n', '<leader>ff', ':Pick files<CR>',
      { noremap = true, silent = true, desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', ':Pick grep_live<CR>',
      { noremap = true, silent = true, desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>',
      { noremap = true, silent = true, desc = 'Buffers' })

    -- Better UI for selecting items
    vim.ui.select = MiniPick.ui_select
  end
)
