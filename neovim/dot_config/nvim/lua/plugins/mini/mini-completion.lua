return {
  'echasnovski/mini.completion',
  version = false,
  event = 'VeryLazy',
  config = function()
    local opts = { filtersort = 'fuzzy' }
    local process_items = function(items, base)
      local default_items = MiniCompletion.default_process_items(items, base, opts)
      local res = {}
      for i, item in ipairs(default_items) do
        local new_item = {}
        for k, v in pairs(item) do
          new_item[k] = v
        end
        if string.len(new_item.label) > 50 then
          new_item.label = string.sub(new_item.label, 1, 47) .. '...'
        end
        table.insert(res, new_item)
      end
      return res
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
