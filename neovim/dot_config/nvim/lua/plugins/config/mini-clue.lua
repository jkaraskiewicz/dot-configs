-- Alternative for which-key

local status_ok, mini_clue = pcall(require, 'mini.clue')
if not status_ok then
  print('mini.clue not found')
  return
end

mini_clue.setup({
  triggers = {
    -- Leader key completion
    { mode = 'n', keys = '<leader>' },
    { mode = 'x', keys = '<leader>' },
    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },
    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },
  clues = {
    { mode = 'n', keys = '<leader>e',  desc = '+Explorer' },
    { mode = 'n', keys = '<leader>f',  desc = '+Find' },
    { mode = 'n', keys = '<leader>S',  desc = '+Sessions' },
    { mode = 'n', keys = '<leader>s',  desc = '+Search' },
    { mode = 'n', keys = '<leader>r',  desc = '+Refactor' },
    { mode = 'n', keys = '<leader>b',  desc = '+Buffer' },
    { mode = 'n', keys = '<leader>bl', desc = '+Language' },
    { mode = 'n', keys = '<leader>X',  desc = '+Mini' },
    mini_clue.gen_clues.builtin_completion(),
    mini_clue.gen_clues.g(),
    mini_clue.gen_clues.registers(),
    mini_clue.gen_clues.windows(),
    mini_clue.gen_clues.z(),
  },
  window = {
    delay = 100,
    config = {
      width = 50,
      border = 'double',
    },
  },
})
