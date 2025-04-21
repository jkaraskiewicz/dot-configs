vim.lsp.config('tsserver', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact', -- .jsx
    'typescript',
    'typescriptreact', -- .tsx
  },
  root_markers = {
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    '.git', -- General fallback
  },
  settings = {},
})

vim.lsp.enable('tsserver')
