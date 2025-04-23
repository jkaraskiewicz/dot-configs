-- Search and replace multiple words in the buffer

MiniDeps.later(
  function()
    local status_ok, muren = pcall(require, 'muren')
    if not status_ok then
      print('muren not found')
      return
    end

    muren.setup()

    vim.keymap.set(
      'n',
      '<leader>sm',
      function()
        require('muren.api').toggle_ui()
      end,
      { noremap = true, silent = true, desc = 'Multi search/replace' }
    )
  end
)
