-- File explorer

local status_ok, neo_tree = pcall(require, 'neo-tree')
if not status_ok then
  print('neo_tree not found')
  return
end

neo_tree.setup({
  close_if_last_window = true,
  filesystem = {
    filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
  },
})

vim.keymap.set(
  'n',
  '<leader>ee',
  ':Neotree toggle<CR>',
  {
    noremap = true,
    silent = true,
    desc = 'Toggle Neo-tree',
  }
)

vim.keymap.set(
  'n',
  '<leader>ec',
  ':Neotree filesystem reveal left<CR>',
  {
    noremap = true,
    silent = true,
    desc = 'Expand to current file',
  }
)
