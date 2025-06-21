return {
  'svban/YankAssassin.nvim',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('YankAssassin').setup {
      auto_normal = true,
      auto_visual = true,
    }
  end,
}
