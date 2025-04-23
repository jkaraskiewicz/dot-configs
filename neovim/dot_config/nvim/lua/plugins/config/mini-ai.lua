-- More and better handling of text objects

MiniDeps.later(
  function()
    local status_ok, mini_ai = pcall(require, 'mini.ai')
    if not status_ok then
      print('mini.ai not found')
      return
    end

    mini_ai.setup({
      custom_textobjects = {
        W = { '%f[%w_%-.][%w_%-.]+' },
      },
    })
  end
)
