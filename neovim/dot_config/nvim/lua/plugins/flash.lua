return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    -- Jump labels
    labels = 'asdfghjklqwertyuiopzxcvbnm',
    search = {
      multi_window = true,
      forward = true,
      wrap = true,
      mode = 'exact', -- exact|search|fuzzy
    },
    jump = {
      jumplist = true,
      pos = 'start', -- start|end|range
      history = false,
      register = false,
      nohlsearch = true,
      autojump = false,
    },
    label = {
      uppercase = true,
      rainbow = {
        enabled = false,
        shade = 5,
      },
      -- Show labels after the match
      after = true,
      before = false,
      style = 'overlay', -- overlay|inline|eol
      reuse = 'lowercase',
      distance = true,
      min_pattern_length = 0,
    },
    highlight = {
      backdrop = true,
      matches = true,
      priority = 5000,
      groups = {
        match = 'FlashMatch',
        current = 'FlashCurrent',
        backdrop = 'FlashBackdrop',
        label = 'FlashLabel',
      },
    },
    modes = {
      char = {
        enabled = false, -- Disable f/F/t/T enhancement to keep default vim behavior
      },
    },
    prompt = {
      enabled = true,
      prefix = { { '⚡', 'FlashPromptIcon' } },
    },
  },
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash jump',
    },
    {
      'S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash treesitter',
    },
    {
      '<leader>/',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump({
          search = { mode = 'search', max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = '^',
        })
      end,
      desc = 'Flash search',
    },
  },
}
