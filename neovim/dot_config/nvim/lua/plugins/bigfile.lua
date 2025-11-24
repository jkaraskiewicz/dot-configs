return {
  'LunarVim/bigfile.nvim',
  event = 'BufReadPre',
  config = function()
    require('bigfile').setup({
      filesize = 1, -- Size in MiB (1MB threshold)
      pattern = function(bufnr, filesize_mib)
        -- Also check line count for files with many lines but small size
        local line_count = vim.api.nvim_buf_line_count(bufnr)
        return filesize_mib > 1 or line_count > 1000
      end,
      features = {
        'indent_blankline',
        'illuminate',
        'lsp',
        'treesitter',
        'syntax',
        'matchparen',
        'vimopts',
        'filetype',
        {
          name = 'mini.cursorword',
          disable = function()
            vim.b.minicursorword_disable = true
          end,
        },
        {
          name = 'mini.animate',
          disable = function()
            vim.b.minianimate_disable = true
          end,
        },
        {
          name = 'mini.diff',
          disable = function()
            vim.b.minidiff_disable = true
          end,
        },
      },
    })
  end,
}
