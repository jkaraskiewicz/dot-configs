return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  version = false,
  init = function()
    require('nvim-treesitter.configs').setup({
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next = {
            [']m'] = { query = '@method.outer', desc = 'Next function' },
            [']c'] = { query = '@call.*', desc = 'Next call' },
          },
          goto_previous = {
            ['[m'] = { query = '@method.outer', desc = 'Previous function' },
            ['[c'] = { query = '@call.*', desc = 'Previous call' },
          },
        },
      },
    })
    local repeatable_move = require('nvim-treesitter.textobjects.repeatable_move')
    vim.keymap.set({ 'n', 'x', 'o' }, ']]', repeatable_move.repeat_last_move_next,
      { noremap = true, silent = true, desc = 'Repeat last next move' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[[', repeatable_move.repeat_last_move_previous,
      { noremap = true, silent = true, desc = 'Repeat last previous move' })
  end,
}
