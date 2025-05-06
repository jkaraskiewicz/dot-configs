return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false, -- it loads itself lazily
  opts = {
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
  },
  keys = {
    {
      '<leader>ee',
      ':Neotree toggle<cr>',
      desc = 'Toggle Neo-tree',
    },
    {
      '<leader>ec',
      ':Neotree filesystem reveal left<cr>',
      desc = 'Expand to current file',
    },
  },
}
