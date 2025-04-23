-- Extended f, F, t, T motions

MiniDeps.later(
  function()
    local status_ok, mini_jump = pcall(require, 'mini.jump')
    if not status_ok then
      print('mini.jump not found')
      return
    end

    mini_jump.setup({
      mappings = {
        repeat_jump = '',
      },
    })
  end
)
