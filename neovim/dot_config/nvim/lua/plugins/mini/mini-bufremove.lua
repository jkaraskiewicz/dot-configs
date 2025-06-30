return {
  'echasnovski/mini.bufremove',
  version = false,
  event = 'VeryLazy',
  config = function()
    local mini_bufremove = require('mini.bufremove')
    mini_bufremove.setup()

    vim.keymap.set(
      'n',
      '<leader>bd',
      function()
        mini_bufremove.delete(0)
      end,
      { desc = 'Delete buffer' }
    )
    vim.keymap.set(
      'n',
      '<leader>bq',
      function()
        local current_buf_id = vim.api.nvim_get_current_buf()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
            if bufnr ~= 0 and bufnr ~= current_buf_id then mini_bufremove.delete(bufnr) end
          end
        end
      end,
      { desc = 'Delete other buffers' }
    )
  end,
}
