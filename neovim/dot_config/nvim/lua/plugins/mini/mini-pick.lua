return {
  'echasnovski/mini.pick',
  version = false,
  keys = {
    { '<leader>ff', ':Pick files<CR>',     desc = 'Find files' },
    { '<leader>fg', ':Pick grep_live<CR>', desc = 'Find text (live grep)' },
    { '<leader>fb', ':Pick buffers<CR>',   desc = 'Find buffers' },
  },
  config = function()
    require('mini.pick').setup()

    -- Custom pick actions
    local languages = {
      {
        display = 'C++',
        action = function() vim.bo.filetype = 'cpp' end,
      },
      {
        display = 'JSON',
        action = function() vim.bo.filetype = 'json' end,
      },
      {
        display = 'Java',
        action = function() vim.bo.filetype = 'java' end,
      },
      {
        display = 'JavaScript',
        action = function() vim.bo.filetype = 'javascript' end,
      },
      {
        display = 'Kotlin',
        action = function() vim.bo.filetype = 'kotlin' end,
      },
      {
        display = 'Lua',
        action = function() vim.bo.filetype = 'lua' end,
      },
      {
        display = 'Markdown',
        action = function() vim.bo.filetype = 'markdown' end,
      },
      {
        display = 'Rust',
        action = function() vim.bo.filetype = 'rust' end,
      },
      {
        display = 'Sh',
        action = function() vim.bo.filetype = 'sh' end,
      },
      {
        display = 'YAML',
        action = function() vim.bo.filetype = 'yaml' end,
      },
      {
        display = 'Zsh',
        action = function() vim.bo.filetype = 'zsh' end,
      },
    }

    local lib = require('lib')

    local function on_language_choice(data)
      vim.api.nvim_buf_call(
        vim.fn.bufnr('#'),
        function() data.action() end
      )
      MiniPick.stop()
      return true
    end

    vim.keymap.set(
      'n',
      '<leader>bl',
      function()
        MiniPick.start({
          source = {
            items = languages,
            show = function(buf_id, items, query)
              MiniPick.default_show(buf_id, lib.map(items, function(item) return item.display end), query)
            end,
            name = 'Buffer language',
            choose = on_language_choice,
          },
        })
      end,
      { noremap = true, silent = true, desc = 'Set buffer language' }
    )

    -- Choose MiniPick as the default select tool for vim
    vim.ui.select = MiniPick.ui_select
  end,
}
