-- Completion plugin from mini.nvim

MiniDeps.later(
  function()
    local status_ok, mini_completion = pcall(require, 'mini.completion')
    if not status_ok then
      print('mini.completion not found')
      return
    end

    mini_completion.setup({
      window = {
        info = { border = 'solid' },      -- Use rounded border for documentation popup
        signature = { border = 'solid' }, -- Use rounded border for signature help popup
      },
    })
  end
)
