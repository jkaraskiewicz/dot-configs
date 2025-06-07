return {
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    "../..,?/node_modules",
    "--ngProbeLocations",
    "../..,?/node_modules",
    "--angularCoreVersion",
    ""
  },
  filetypes = { 'typescript', 'html' },
  root_markers = {
    'angular.json',
    'package.json',  -- Contains angular dependencies
    'tsconfig.json', -- Base TS config
    '.git',          -- General fallback
  },
  settings = {},
}
