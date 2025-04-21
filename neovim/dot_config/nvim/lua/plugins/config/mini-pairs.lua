-- Adds closing ), ", ' etc.

local status_ok, mini_pairs = pcall(require, 'mini.pairs')
if not status_ok then
  print('mini.pairs not found')
  return
end

mini_pairs.setup()
