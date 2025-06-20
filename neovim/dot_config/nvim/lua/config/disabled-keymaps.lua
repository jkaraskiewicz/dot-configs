-- Disable some LSP keybinds by default (they will be enabled in LspOnAttach)
pcall(vim.keymap.del, 'n', 'gO')
pcall(vim.keymap.del, 'n', 'gra')
pcall(vim.keymap.del, 'x', 'gra')
pcall(vim.keymap.del, 'n', 'grn')
pcall(vim.keymap.del, 'n', 'grd')
pcall(vim.keymap.del, 'n', 'grr')
pcall(vim.keymap.del, 'n', 'gri')
pcall(vim.keymap.del, 'n', 'grs')
pcall(vim.keymap.del, 'n', 'gx')
pcall(vim.keymap.del, 'x', 'gx')

-- Disable built-in `[` and `]` mappings
pcall(vim.keymap.del, 'n', '[a')
pcall(vim.keymap.del, 'n', '[A')
pcall(vim.keymap.del, 'n', '[b')
pcall(vim.keymap.del, 'n', '[B')
pcall(vim.keymap.del, 'n', '[D')
pcall(vim.keymap.del, 'n', '[d')
pcall(vim.keymap.del, 'n', '[l')
pcall(vim.keymap.del, 'n', '[L')
pcall(vim.keymap.del, 'n', '[Q')
pcall(vim.keymap.del, 'n', '[q')
pcall(vim.keymap.del, 'n', '[T')
pcall(vim.keymap.del, 'n', '[t')
pcall(vim.keymap.del, 'n', '[<c-l>')
pcall(vim.keymap.del, 'n', '[<c-q>')
pcall(vim.keymap.del, 'n', '[<c-t>')
pcall(vim.keymap.del, 'n', '[<space>')

pcall(vim.keymap.del, 'n', ']a')
pcall(vim.keymap.del, 'n', ']A')
pcall(vim.keymap.del, 'n', ']b')
pcall(vim.keymap.del, 'n', ']B')
pcall(vim.keymap.del, 'n', ']D')
pcall(vim.keymap.del, 'n', ']d')
pcall(vim.keymap.del, 'n', ']l')
pcall(vim.keymap.del, 'n', ']L')
pcall(vim.keymap.del, 'n', ']Q')
pcall(vim.keymap.del, 'n', ']q')
pcall(vim.keymap.del, 'n', ']T')
pcall(vim.keymap.del, 'n', ']t')
pcall(vim.keymap.del, 'n', ']<c-l>')
pcall(vim.keymap.del, 'n', ']<c-q>')
pcall(vim.keymap.del, 'n', ']<c-t>')
pcall(vim.keymap.del, 'n', ']<space>')

-- Disable built-in text objects
local text_object_suffixes = {
  's',
  'p',
  'b',
  'B',
  't',
  "'",
  '"',
  '`',
  '[',
  '<',
}

for _, suffix in ipairs(text_object_suffixes) do
  local inner_obj_lhs = 'i' .. suffix
  local around_obj_lhs = 'a' .. suffix

  vim.keymap.set(
    { 'o', 'x' },
    inner_obj_lhs,
    '<Nop>',
    { noremap = true, silent = true, desc = 'Disabled default text object: ' .. inner_obj_lhs }
  )
  vim.keymap.set(
    { 'o', 'x' },
    around_obj_lhs,
    '<Nop>',
    { noremap = true, silent = true, desc = 'Disabled default text object: ' .. around_obj_lhs }
  )
end

-- Disable standard keymaps for s and S (can be replaced by cl and cc)
vim.keymap.set('n', 's', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'S', '<Nop>', { noremap = true, silent = true })

