return {
  'code-biscuits/nvim-biscuits',
  event = 'VeryLazy',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
    },
  },
  config = function()
    require('nvim-biscuits').setup({
      default_config = {
        prefix_string = ' ⤌ ',
        cursor_line_only = true,
      },
      max_file_size = '15kb',
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      pattern = '*',
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local lang = require('nvim-treesitter.parsers').get_buf_lang(bufnr):gsub('-', '')
        require('nvim-biscuits').decorate_nodes(bufnr, lang)
      end,
    })
  end,
}
