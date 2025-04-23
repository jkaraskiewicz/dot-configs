-- Highlight / remove trailing white spaces

MiniDeps.later(
  function()
    local status_ok, mini_trailspace = pcall(require, 'mini.trailspace')
    if not status_ok then
      print('mini.trailspace not found')
      return
    end

    mini_trailspace.setup()
  end
)
