-- Splits function call args to multiple lines or to a single line with gS

MiniDeps.later(
  function()
    local status_ok, mini_splitjoin = pcall(require, 'mini.splitjoin')
    if not status_ok then
      print('mini.splitjoin not found')
      return
    end

    mini_splitjoin.setup()
  end
)
