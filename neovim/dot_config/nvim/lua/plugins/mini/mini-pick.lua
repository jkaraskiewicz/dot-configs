return {
  'nvim-mini/mini.pick',
  version = false,
  keys = {
    { '<leader>ff', function() vim.cmd('Pick files') end,                desc = 'Files' },
    { '<leader>fg', function() vim.cmd('Pick grep_live') end,            desc = 'Live grep' },
    { '<leader>fl', function() vim.cmd('Pick buffer_lines_current') end, desc = 'Lines' },
    {
      '<leader>fr',
      function()
        require('mini.pick').builtin.resume()
      end,
      desc = 'Resume picker',
    },
    {
      '<leader>fv',
      function()
        require('mini.extra').pickers.visit_paths({
          sort = function(path_data_arr)
            local fn = require('mini.visits').gen_sort.default({ recency_weight = 1 })
            local results = fn(path_data_arr)
            return require('utils.utils').first_n(results, 10)
          end,
        })
      end,
      desc = 'Recent files',
    },
    {
      '<leader>sw',
      function()
        local ok, MiniPick = pcall(require, 'mini.pick')
        if not ok then return end

        local word = vim.fn.expand('<cword>')
        vim.schedule(function()
          MiniPick.set_picker_query(vim.split(word, ''))
        end)
        MiniPick.builtin.grep_live()
      end,
      desc = 'Search word under cursor',
    },
    {
      '<leader>sW',
      function()
        local ok, MiniPick = pcall(require, 'mini.pick')
        if not ok then return end

        vim.opt_local.iskeyword:append('-,_')
        local word = vim.fn.expand('<cword>')
        vim.opt_local.iskeyword:remove('-,_')
        vim.schedule(function()
          MiniPick.set_picker_query(vim.split(word, ''))
        end)
        MiniPick.builtin.grep_live()
      end,
      desc = 'Search WORD under cursor',
    },
  },
  init = function()
    -- Center the window
    local win_config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end

    -- Setup the plugin
    require('mini.pick').setup({
      window = {
        config = win_config,
      },
    })

    -- Custom picker for setting buffer's file type
    local language_types = {
      'cpp', 'json', 'java', 'javascript', 'kotlin', 'lua',
      'markdown', 'rust', 'sh', 'yaml', 'zsh',
    }

    local languages = {}
    for _, lang_type in ipairs(language_types) do
      table.insert(languages, {
        display = lang_type:sub(1, 1):upper() .. lang_type:sub(2), -- Capitalize first letter for display
        action = function() vim.bo.filetype = lang_type end,
      })
    end

    local utils = require('utils.utils')

    local function on_language_choice(data)
      local MiniPick = require('mini.pick')
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
        local MiniPick = require('mini.pick')
        MiniPick.start({
          source = {
            items = languages,
            show = function(buf_id, items, query)
              MiniPick.default_show(buf_id, utils.map(items, function(item) return item.display end), query)
            end,
            name = 'Buffer language',
            choose = on_language_choice,
          },
        })
      end,
      { noremap = true, silent = true, desc = 'Set buffer language' }
    )

    -- Use treesitter syntax highlighting for lines picker
    -- from https://github.com/nvim-mini/mini.nvim/discussions/988
    local ns_digit_prefix = vim.api.nvim_create_namespace('cur-buf-pick-show')
    local show_cur_buf_lines = function(buf_id, items, query, opts)
      if items == nil or #items == 0 then
        return
      end

      local MiniPick = require('mini.pick')
      -- Show as usual
      MiniPick.default_show(buf_id, items, query, opts)

      -- Move prefix line numbers into inline extmarks
      local lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)
      local digit_prefixes = {}
      for i, l in ipairs(lines) do
        local _, prefix_end, prefix = l:find('^(%s*%d+│)')
        if prefix_end ~= nil then
          digit_prefixes[i], lines[i] = prefix, l:sub(prefix_end + 1)
        end
      end

      vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
      for i, pref in pairs(digit_prefixes) do
        local opts = { virt_text = { { pref, 'MiniPickNormal' } }, virt_text_pos = 'inline' }
        vim.api.nvim_buf_set_extmark(buf_id, ns_digit_prefix, i - 1, 0, opts)
      end

      -- Set highlighting based on the curent filetype
      local ft = vim.bo[items[1].bufnr].filetype
      local has_lang, lang = pcall(vim.treesitter.language.get_lang, ft)
      local has_ts, _ = pcall(vim.treesitter.start, buf_id, has_lang and lang or ft)
      if not has_ts and ft then vim.bo[buf_id].syntax = ft end
    end

    MiniPick.registry.buffer_lines_current = function()
      -- local local_opts = { scope = "current", preserve_order = true } -- use preserve_order
      local local_opts = { scope = 'current' }
      require('mini.extra').pickers.buf_lines(local_opts, { source = { show = show_cur_buf_lines } })
    end

    -- Choose MiniPick as the default select tool for vim
    local ok, MiniPick = pcall(require, 'mini.pick')
    if ok and MiniPick.ui_select then
      vim.ui.select = MiniPick.ui_select
    end
  end,
}
