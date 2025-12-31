return {
  'nvim-mini/mini.completion',
  version = false,
  event = 'VeryLazy',
  config = function()
    -- Configuration constants
    local MAX_LABEL_LENGTH = 60             -- Skip items with labels longer than this
    local MAX_TRUNCATED_LABEL = 50          -- Truncate displayed labels at this length
    local TRUNCATED_SUFFIX_LEN = 47         -- Length before adding '...'
    local MAX_COMPLETION_ITEMS = 25         -- Limit results to reduce cognitive load

    -- Scoring weights
    local SCORE_EXACT_MATCH = 1000
    local SCORE_EXACT_CASE_INSENSITIVE = 900
    local SCORE_PREFIX_MATCH = 500
    local SCORE_SNIPPET = 200
    local SCORE_METHOD_FUNCTION = 100
    local SCORE_PRESELECT_BOOST = 100
    local SCORE_VARIABLE = 90
    local SCORE_FIELD = 85
    local SCORE_PROPERTY = 85
    local SCORE_CLASS = 80
    local SCORE_INTERFACE = 80
    local SCORE_MODULE = 75
    local SCORE_CONSTANT = 70
    local SCORE_ENUM = 65
    local SCORE_STRUCT = 65
    local SCORE_SORTTEXT_BOOST = 50
    local SCORE_KEYWORD = 30
    local SCORE_TEXT = -100                 -- Lowest priority
    local SCORE_LENGTH_PENALTY_DIVISOR = 10

    -- Completion delay timings (milliseconds)
    local DELAY_COMPLETION = 300
    local DELAY_INFO = 200
    local DELAY_SIGNATURE = 200

    -- Popup menu settings
    local PUMBLEND = 10
    local PUMHEIGHT = 25
    local PUMMAXWIDTH = 80

    local opts = { filtersort = 'fuzzy' }
    local process_items = function(items, base)
      -- Filter noise universally (works for all languages)
      local filtered = vim.tbl_filter(function(item)
        -- Skip overly long symbols (auto-generated, macros, deeply nested paths)
        if item.label and #item.label > MAX_LABEL_LENGTH then
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
          score = score + SCORE_EXACT_MATCH
        elseif filter_lower == base_lower then
          score = score + SCORE_EXACT_CASE_INSENSITIVE -- Case-insensitive exact match
        -- 2. Prefix match
        elseif vim.startswith(filter_lower, base_lower) then
          score = score + SCORE_PREFIX_MATCH
        end

        -- 3. Kind-based prioritization (aligned with nvim-cmp defaults)
        local kind = item.kind or 1
        if kind == 15 then
          score = score + SCORE_SNIPPET -- Snippet
        elseif kind == 2 or kind == 3 then
          score = score + SCORE_METHOD_FUNCTION -- Method/Function
        elseif kind == 6 then
          score = score + SCORE_VARIABLE -- Variable
        elseif kind == 5 then
          score = score + SCORE_FIELD -- Field
        elseif kind == 10 then
          score = score + SCORE_PROPERTY -- Property
        elseif kind == 7 then
          score = score + SCORE_CLASS -- Class
        elseif kind == 8 then
          score = score + SCORE_INTERFACE -- Interface
        elseif kind == 9 then
          score = score + SCORE_MODULE -- Module
        elseif kind == 21 then
          score = score + SCORE_CONSTANT -- Constant
        elseif kind == 13 then
          score = score + SCORE_ENUM -- Enum
        elseif kind == 22 then
          score = score + SCORE_STRUCT -- Struct
        elseif kind == 14 then
          score = score + SCORE_KEYWORD -- Keyword
        elseif kind == 1 then
          score = score + SCORE_TEXT -- Text (lowest priority)
        end

        -- 4. Prefer shorter items (less typing)
        score = score - (#item.label / SCORE_LENGTH_PENALTY_DIVISOR)

        -- 5. Boost items with sortText (LSP server knows best)
        if item.sortText then
          score = score + SCORE_SORTTEXT_BOOST
        end

        -- 6. Boost preselected items (LSP server suggestion)
        if item.preselect then
          score = score + SCORE_PRESELECT_BOOST
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
        if #item.label > MAX_TRUNCATED_LABEL then
          item.label = item.label:sub(1, TRUNCATED_SUFFIX_LEN) .. '...'
        end
        table.insert(result, item)
      end

      -- Limit to top results to reduce cognitive load
      local limited = {}
      for i = 1, math.min(MAX_COMPLETION_ITEMS, #result) do
        table.insert(limited, result[i])
      end

      return limited
    end

    require('mini.completion').setup({
      delay = {
        completion = DELAY_COMPLETION,
        info = DELAY_INFO,
        signature = DELAY_SIGNATURE,
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
      vim.opt.pumblend = PUMBLEND
      vim.opt.pumheight = PUMHEIGHT
      vim.opt.pummaxwidth = PUMMAXWIDTH
    end

    -- vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
  end,
}
