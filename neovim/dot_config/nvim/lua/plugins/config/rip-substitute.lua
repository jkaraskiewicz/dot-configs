-- Simple search/replace within a buffer

MiniDeps.later(
  function()
    local status_ok, rip_substitute = pcall(require, 'rip-substitute')
    if not status_ok then
      print('rip-substitute not found')
      return
    end

    rip_substitute.setup()

    vim.keymap.set(
      'n',
      '<leader>sr',
      function()
        rip_substitute.sub()
      end,
      { noremap = true, silent = true, desc = 'Search/replace' }
    )

    vim.keymap.set(
      'x',
      '<leader>sr',
      function()
        rip_substitute.sub()
      end,
      { noremap = true, silent = true, desc = 'Search/replace' }
    )
  end
)
