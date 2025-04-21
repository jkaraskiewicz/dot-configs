-- Handle copy/paste outside of nvim

local status_ok, osc52 = pcall(require, 'osc52')
if not status_ok then
  print('osc52 not found')
  return
end

osc52.setup({
  max_length = 0, -- Maximum length of selection (0 for no limit)
  silent = false, -- Disable message on successful copy
  trim = false,   -- Trim surrounding whitespaces before copy
})


local function copy()
  if (vim.v.event.operator == 'y' or vim.v.event.operator == 'd') and vim.v.event.regname == '' then
    require('osc52').copy_register('')
  end
end

vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
