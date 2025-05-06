return {
  'kr40/nvim-macros',
  cmd = { 'MacroSave', 'MacroYank', 'MacroSelect', 'MacroDelete' },
  opts = {
    json_file_path = vim.fs.normalize(vim.fn.stdpath('config') .. '/macros.json'),
    default_macro_register = 'q',
    json_formatter = 'none',
  },
  keys = {
    { '<leader>Ms', ':MacroSave<cr>',   desc = 'Save macro' },
    { '<leader>My', ':MacroYank<cr>',   desc = 'Yank macro from a register' },
    { '<leader>Md', ':MacroDelete<cr>', desc = 'Delete macro' },
    { '<leader>Mc', ':MacroSelect<cr>', desc = 'Select macro' },
  },
}
