vim.diagnostic.config({
  virtual_text = {
    enable = true,
    spacing = 2,
    format = function(diagnostic)
      if string.find(diagnostic.message, 'Undefined global `vim`') then
        return nil
      else
        return string.format('%s', diagnostic.message)
      end
    end,
  },
})
