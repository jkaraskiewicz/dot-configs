return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml' },
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = false, -- Default to false for speed. Enable manually if needed.
        buildScripts = {
          enable = true,
        },
      },
      check = {
        command = 'clippy',
        allFeatures = false,
      },
      procMacro = {
        enable = true,
        attributes = { enable = true },
      },
      inlayHints = {
        bindingModeHints = { enable = false },
        chainingHints = { enable = true },
        closingBraceHints = { minLines = 10 },
        closureReturnTypeHints = { enable = 'with_block' },
        lifetimeElisionHints = { enable = 'skip_trivial', useParameterNames = true },
        parameterHints = { enable = true },
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
      completion = {
        callable = { snippets = 'add_parentheses' },
        postfix = { enable = true },
      },
      imports = {
        granularity = { group = 'module' },
        prefix = 'crate',
      },
      lens = {
        enable = true,
        references = {
          adt = { enable = false },
          method = { enable = true },
          trait = { enable = true },
        },
      },
    },
  },
}
