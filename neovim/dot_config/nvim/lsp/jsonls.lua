return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { 'package.json', '.git' },
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { 'package.json' },
          url = 'http://json.schemastore.org/package',
        },
        {
          fileMatch = { 'composer.json' },
          url = 'http://json.schemastore.org/composer',
        },
      },
    },
  },
}
