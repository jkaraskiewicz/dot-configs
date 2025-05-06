return {
  cmd = { 'java-language-server' },
  filetypes = { 'java' },
  root_markers = {
    'pom.xml',             -- Maven
    'build.gradle',        -- Gradle (Groovy DSL)
    'settings.gradle',     -- Gradle
    'build.gradle.kts',    -- Gradle (Kotlin DSL)
    'settings.gradle.kts', -- Gradle
    '.git',                -- Fallback for general project structure
  },
  settings = {},
}
