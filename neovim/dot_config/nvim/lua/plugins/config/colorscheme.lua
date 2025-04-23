-- Darcula color scheme

local status_ok, darcula = pcall(require, 'darcula')
if not status_ok then
  print('darcula-dark colorscheme not found!')
  -- Fallback or default colorscheme
  vim.cmd [[colorscheme habamax]] -- habamax is built-in
  return
end

darcula.setup()

vim.cmd [[colorscheme kanagawa]]
