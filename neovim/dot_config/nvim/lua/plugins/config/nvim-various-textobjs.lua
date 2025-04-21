-- Extra text objects

local status_ok, various_textobjs = pcall(require, 'various-textobjs')
if not status_ok then
  print('various-textobjs not found')
  return
end

various_textobjs.setup({
  keymaps = {
    useDefaults = true,
  },
})
