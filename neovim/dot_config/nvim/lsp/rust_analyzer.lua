return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml' },
  settings = {
    ['rust-analyzer'] = {
      -- Cargo settings
      cargo = {
        allFeatures = true, -- Analyze with all features enabled
        buildScripts = {
          enable = true, -- Run build scripts for proc macros
        },
      },

      -- Check on save
      checkOnSave = {
        command = 'clippy', -- Use clippy instead of check
        allFeatures = true,
      },

      -- Proc macro support
      procMacro = {
        enable = true,
        attributes = {
          enable = true,
        },
      },

      -- Diagnostics
      diagnostics = {
        enable = true,
        experimental = {
          enable = false, -- Can be noisy
        },
      },

      -- Inlay hints
      inlayHints = {
        bindingModeHints = {
          enable = false, -- Disabled: can be noisy
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          minLines = 10, -- Only show for functions >10 lines
        },
        closureReturnTypeHints = {
          enable = 'with_block', -- Show return types for closures with blocks
        },
        lifetimeElisionHints = {
          enable = 'skip_trivial',
          useParameterNames = true,
        },
        parameterHints = {
          enable = true,
        },
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },

      -- Completion settings
      completion = {
        callable = {
          snippets = 'add_parentheses', -- Auto-add () for functions
        },
        postfix = {
          enable = true, -- Enable postfix completions like .dbg, .if, etc.
        },
      },

      -- Imports
      imports = {
        granularity = {
          group = 'module', -- Group imports by module
        },
        prefix = 'crate', -- Use 'crate::' for internal imports
      },

      -- Hover actions
      hover = {
        actions = {
          enable = true,
          references = {
            enable = true,
          },
        },
      },

      -- Lens (code actions above functions)
      lens = {
        enable = true,
        references = {
          adt = { enable = true },       -- References for structs/enums
          enumVariant = { enable = true }, -- References for enum variants
          method = { enable = true },      -- References for methods
          trait = { enable = true },       -- References for traits
        },
      },
    },
  },
}
