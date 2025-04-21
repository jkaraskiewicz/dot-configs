-- Completion plugin from mini.nvim

local status_ok, mini_completion = pcall(require, 'mini.completion')
if not status_ok then
  print('mini.completion not found')
  return
end

mini_completion.setup({
  window = {
    info = { border = 'rounded' },      -- Use rounded border for documentation popup
    signature = { border = 'rounded' }, -- Use rounded border for signature help popup
  },
})
