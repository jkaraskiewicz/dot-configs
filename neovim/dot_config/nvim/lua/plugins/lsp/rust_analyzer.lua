return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml' },
  settings = {
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
}
