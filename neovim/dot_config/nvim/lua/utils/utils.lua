local M = {}

-- Map a table into another table by applying 'f'
function M.map(tbl, f)
  local t = {}
  for k, v in pairs(tbl) do
    t[k] = f(v)
  end
  return t
end

-- Return an array containing first n elements of the input array
function M.first_n(arr, n)
  local newArray = {}
  for i = 1, math.min(n, #arr) do
    newArray[i] = arr[i]
  end
  return newArray
end

-- Find the name of the current function/method (based on the cursor position)
-- Courtesy of Gemini
function M.get_current_function_name()
  local ts_utils = require('nvim-treesitter.ts_utils')
  local current_node = ts_utils.get_node_at_cursor()

  if not current_node then
    return ''
  end

  local function find_ancestor(node, type_pattern)
    local ancestor = node
    while ancestor do
      if type(type_pattern) == 'string' then
        if ancestor:type() == type_pattern then
          return ancestor
        end
      elseif type(type_pattern) == 'table' then
        for _, pattern in ipairs(type_pattern) do
          if ancestor:type() == pattern then
            return ancestor
          end
        end
      end
      ancestor = ancestor:parent()
    end
    return nil
  end

  -- Common Treesitter node types for function/method definitions.
  -- This list might need to be extended based on the language.
  local function_node_types = {
    'function_definition',
    'function_declaration',
    'method_definition',
    'arrow_function',
    'function_item',          -- Rust
    'subroutine_declaration', -- Perl
    -- Add more types as needed per language, e.g., "lambda_expression", "class_method", etc.
  }

  local func_node = find_ancestor(current_node, function_node_types)

  if func_node then
    -- Common node types for identifiers (function names).
    -- This also might need language-specific adjustments.
    -- Some languages use 'identifier', others 'name', some might have specific ones like 'field_identifier' for methods.
    local name_node_types = { 'identifier', 'name', 'field_identifier', 'simple_identifier' }
    for _, child in ipairs(func_node:named_children()) do
      for _, name_type in ipairs(name_node_types) do
        if child:type() == name_type then
          return vim.treesitter.get_node_text(child, 0) -- 0 is the buffer number (current)
        end
      end
      -- Fallback for some structures where the name isn't a direct child identifier
      -- e.g. Rust `fn foo()` name is child 0 if not other modifiers.
      -- This part might need more robust logic based on language grammars.
      if child:type() == 'identifier' then -- A common fallback
        return vim.treesitter.get_node_text(child, 0)
      end
    end
    -- If no named child is an identifier, try to get the first named child as a guess (less reliable)
    -- Or look for specific patterns in certain languages.
    -- For example, in Python, the name node is often a direct child with type 'identifier'.
    -- In C++, it could be a 'qualified_identifier' or 'operator_name', etc.
    -- A common pattern is that the name node is one of the first children.
    local first_potential_name_child = func_node:named_child(0)
    if first_potential_name_child and vim.tbl_contains(name_node_types, first_potential_name_child:type()) then
      return vim.treesitter.get_node_text(first_potential_name_child, 0)
    end
  end

  return ''
end

local function split_lines(str)
  local lines = {}
  for line in str:gmatch('([^\n]*)\n?') do
    if line ~= '' or str:sub(-1) == '\n' then
      table.insert(lines, line)
    end
  end
  if #lines > 0 and str:sub(-1) == '\n' and lines[#lines] == '' then
    table.remove(lines)
  end
  return lines
end

-- Create a new buffer with predefined text (in a new window)
function M.open_buffer_with_content(content, filetype)
  local prev_bufnr = vim.fn.bufnr('config-help')
  if prev_bufnr ~= -1 then
    vim.cmd(string.format('%s %d', 'bwipeout!', prev_bufnr))
  end

  local bufnr = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_name(bufnr, 'config-help')
  vim.cmd('split')
  vim.api.nvim_set_current_buf(bufnr)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, split_lines(content))
  if filetype ~= nil then
    vim.api.nvim_buf_set_option(bufnr, 'filetype', filetype)
  end
  vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
  vim.cmd('normal! gg')
end

return M
