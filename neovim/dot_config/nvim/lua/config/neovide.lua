-- Animations
vim.g.neovide_cursor_trail_size = 0.0
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_vfx_mode = { '', '' }
vim.g.neovide_cursor_animation_length = 0.05

vim.g.neovide_position_animation_length = 0.5
vim.g.neovide_scroll_animation_length = 0.1

-- Behavior on quit
vim.g.neovide_detach_on_quit = 'always_detach'

-- Scale UI up and down with Ctrl-=
vim.g.neovide_scale_factor = 1.0

local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set('n', '<C-=>', function() change_scale_factor(1.1) end)
vim.keymap.set('n', '<C-->', function() change_scale_factor(1 / 1.1) end)
