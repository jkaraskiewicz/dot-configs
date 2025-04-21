vim.lsp.config('kotlinls', {
  cmd = { 'kotlin-language-server' },
  filetypes = { 'kotlin' },
  root_markers = {
    'build.gradle.kts', -- Gradle Kotlin DSL
    'settings.gradle.kts',
    'build.gradle',     -- Gradle Groovy DSL
    'settings.gradle',
    'pom.xml',          -- Maven
    '.git',             -- General project fallback
  },
  settings = {},
})

vim.lsp.enable('kotlinls')
