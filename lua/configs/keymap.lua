
-- nvim/lua/configs/keymap.lua

-- Resize window using <Ctrl> arrow keys
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true, desc = 'Increase window height' })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true, desc = 'Decrease window height' })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = 'Decrease window width' })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = 'Increase window width' })

-- Custom insert
function insertArrow()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i →", true, true, true), 'n', true)
end

vim.api.nvim_set_keymap('n', '<leader>ia', ':lua insertArrow()<CR>', { noremap = true, silent = true })

-- Some shortcuts
vim.api.nvim_set_keymap('n', '<C-s>', ':w', { noremap = true, silent = true, desc = 'Save File' })
vim.api.nvim_set_keymap('n', '<C-S>', ':w', { noremap = true, silent = true, desc = 'Save all files' })
