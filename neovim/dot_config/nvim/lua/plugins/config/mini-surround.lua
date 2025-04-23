-- Handle surrounding (), "", [] etc.

MiniDeps.later(
  function()
    local status_ok, mini_surround = pcall(require, 'mini.surround')
    if not status_ok then
      print('mini.surround not found')
      return
    end

    mini_surround.setup({
      mappings = {
        add = 'za',
        delete = 'zd',
        replace = 'zr',
        update_n_lines = 'zn',
      },
    })
  end
)
