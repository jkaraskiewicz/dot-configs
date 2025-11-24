return {
  'echasnovski/mini.completion',
  version = false,
  event = 'VeryLazy',
  config = function()
    local opts = { filtersort = 'fuzzy' }
    local process_items = function(items, base)
      -- Filter noise universally (works for all languages)
      local filtered = vim.tbl_filter(function(item)
        -- Skip overly long symbols (auto-generated, macros, deeply nested paths)
        if item.label and #item.label > 60 then
          return false
        end

        -- Skip double-underscore prefixed items (private/internal)
        if item.label and item.label:match('^__') then
          return false
        end

        -- Skip private class names (_UpperCase pattern)
        if item.label and item.label:match('^_[A-Z]') then
          return false
        end

        -- Skip deprecated items
        if item.deprecated then
          return false
        end

        return true
      end, items)

      -- Use mini.completion's default fuzzy filtering and sorting
      local default_items = MiniCompletion.default_process_items(filtered, base, opts)

      -- Apply advanced custom scoring (inspired by nvim-cmp/blink.cmp)
      local scored = vim.tbl_map(function(item)
        local score = 0

        -- Use filterText for matching, fallback to label
        local filter_word = item.filterText or item.label
        local base_lower = base and base:lower() or ''
        local filter_lower = filter_word:lower()

        -- 1. Exact match gets highest priority
        if filter_word == base then
          score = score + 1000
        elseif filter_lower == base_lower then
          score = score + 900 -- Case-insensitive exact match
        -- 2. Prefix match
        elseif vim.startswith(filter_lower, base_lower) then
          score = score + 500
        end

        -- 3. Kind-based prioritization (aligned with nvim-cmp defaults)
        local kind = item.kind or 1
        if kind == 15 then
          score = score + 200 -- Snippet
        elseif kind == 2 or kind == 3 then
          score = score + 100 -- Method/Function
        elseif kind == 6 then
          score = score + 90 -- Variable
        elseif kind == 5 then
          score = score + 85 -- Field
        elseif kind == 10 then
          score = score + 85 -- Property
        elseif kind == 7 then
          score = score + 80 -- Class
        elseif kind == 8 then
          score = score + 80 -- Interface
        elseif kind == 9 then
          score = score + 75 -- Module
        elseif kind == 21 then
          score = score + 70 -- Constant
        elseif kind == 13 then
          score = score + 65 -- Enum
        elseif kind == 22 then
          score = score + 65 -- Struct
        elseif kind == 14 then
          score = score + 30 -- Keyword
        elseif kind == 1 then
          score = score - 100 -- Text (lowest priority)
        end

        -- 4. Prefer shorter items (less typing)
        score = score - (#item.label / 10)

        -- 5. Boost items with sortText (LSP server knows best)
        if item.sortText then
          score = score + 50
        end

        -- 6. Boost preselected items (LSP server suggestion)
        if item.preselect then
          score = score + 100
        end

        -- Store score for sorting
        item._score = score
        return item
      end, default_items)

      -- Sort by custom score (highest first)
      table.sort(scored, function(a, b)
        return (a._score or 0) > (b._score or 0)
      end)

      -- Clean up temp scores and truncate labels
      local result = {}
      for i, item in ipairs(scored) do
        item._score = nil -- Remove temporary score field
        if #item.label > 50 then
          item.label = item.label:sub(1, 47) .. '...'
        end
        table.insert(result, item)
      end

      -- Limit to top 25 results to reduce cognitive load
      local limited = {}
      for i = 1, math.min(25, #result) do
        table.insert(limited, result[i])
      end

      return limited
    end

    require('mini.completion').setup({
      delay = {
        completion = 300,
        info = 200,
        signature = 200,
      },
      window = {
        info = { border = 'bold' },
        signature = { border = 'bold' },
      },
      lsp_completion = {
        source_func = 'omnifunc',
        auto_setup = false,
        process_items = process_items,
      },
    })

    if not vim.g.neovide then
      vim.opt.pumblend = 10
      vim.opt.pumheight = 25
      vim.opt.pummaxwidth = 80
    end

    -- vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
  end,
}
