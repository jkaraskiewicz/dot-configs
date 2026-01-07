-- =============================================================================
-- DEFAULT TEXT OBJECT KEYBINDS
-- Currently not disabled to evaluate a new approach
-- =============================================================================
-- local text_object_suffixes = {
--   's',
--   'p',
--   'b',
--   'B',
--   't',
--   "'",
--   '"',
--   '`',
--   '[',
--   '<',
-- }
--
-- for _, suffix in ipairs(text_object_suffixes) do
--   local inner_obj_lhs = 'i' .. suffix
--   local around_obj_lhs = 'a' .. suffix
--
--   vim.keymap.set(
--     { 'o', 'x' },
--     inner_obj_lhs,
--     '<Nop>',
--     { noremap = true, silent = true, desc = 'Disabled default text object: ' .. inner_obj_lhs }
--   )
--   vim.keymap.set(
--     { 'o', 'x' },
--     around_obj_lhs,
--     '<Nop>',
--     { noremap = true, silent = true, desc = 'Disabled default text object: ' .. around_obj_lhs }
--   )
-- end


-- =============================================================================
-- BRACKETED KEYBINDS
-- Disable standard Neovim bracketed keybinds
-- Later, we will define our own bracketed keybinds
-- =============================================================================
for i = string.byte('a'), string.byte('z') do
  local char = string.char(i)
  pcall(vim.keymap.del, 'n', '[' .. char)
  pcall(vim.keymap.del, 'n', ']' .. char)
end

for i = string.byte('A'), string.byte('Z') do
  local char = string.char(i)
  pcall(vim.keymap.del, 'n', '[' .. char)
  pcall(vim.keymap.del, 'n', ']' .. char)
end

local other_suffixes = { '<C-L>', '<C-Q>', '<C-T>', '<Space>' }
for _, char in ipairs(other_suffixes) do
  pcall(vim.keymap.del, "n", "[" .. char)
  pcall(vim.keymap.del, "n", "]" .. char)
end

-- Disable standard keymaps for s and S (can be replaced by cl and cc) - for Flash.nvim
vim.keymap.set('n', 's', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'S', '<Nop>', { noremap = true, silent = true })
