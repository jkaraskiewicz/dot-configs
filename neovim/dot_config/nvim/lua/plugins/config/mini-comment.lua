-- Enable commenting of lines and selections with gc, gcc

MiniDeps.later(
  function()
    local status_ok, mini_comment = pcall(require, 'mini.comment')
    if not status_ok then
      print('mini.comment not found')
      return
    end

    mini_comment.setup()
  end
)
