-- Move lines or selections up, down, left, right

MiniDeps.later(
  function()
    local status_ok, mini_move = pcall(require, 'mini.move')
    if not status_ok then
      print('mini.move not found')
      return
    end

    mini_move.setup()
  end
)
