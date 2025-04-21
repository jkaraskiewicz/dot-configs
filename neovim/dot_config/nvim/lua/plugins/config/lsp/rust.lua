vim.lsp.config('rust-lsp', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml' },
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = 'clippy',
      },
      inlayHints = {
        enable = true,
        hideLeastSpecific = true,
      },
      parameterHints = {
        enable = true,
      },
      chainingHints = {
        enable = true,
      },
    },
  },
})

vim.lsp.enable('rust-lsp')
