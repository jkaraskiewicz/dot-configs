vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml' },
  root_markers = { '.git' },
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.1-standalone-strict/all.json'] =
        '/*.k8s.{yaml,yml}',
        ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*.{yaml,yml}',
        ['https://json.schemastore.org/gitlab-ci.json'] = '/.gitlab-ci.{yaml,yml}',
        ['https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json'] =
        '/*.cfn.{yaml,yml}',
        ['./schemas/my-custom-project-schema.json'] = '/my-project-configs/**/*.yaml',
      },
    },
  },
})

vim.lsp.enable('yamlls')
