vim.lsp.config('angularls', {
  cmd = { 'ngserver', '--stdio' },
  filetypes = { 'typescript', 'html' },
  root_markers = {
    'angular.json',
    'package.json',  -- Contains angular dependencies
    'tsconfig.json', -- Base TS config
    '.git',          -- General fallback
  },
  settings = {},
})

vim.lsp.enable('angularls')
