-- nvim/lua/configs/keymap.lua

-- Resize window using <Ctrl> arrow keys
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>',
    { noremap = true, silent = true, desc = 'Increase window height' })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>',
    { noremap = true, silent = true, desc = 'Decrease window height' })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>',
    { noremap = true, silent = true, desc = 'Decrease window width' })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>',
    { noremap = true, silent = true, desc = 'Increase window width' })


vim.api.nvim_set_keymap('n', '<leader>th', ':set invhlsearch hlsearch?<CR>',
    { noremap = true, silent = true, desc = '[T]oggle [H]ighlight Search' })

-- Custom insert
function insertArrow()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i →", true, true, true), 'n', true)
end

vim.api.nvim_set_keymap('n', '<leader>ia', ':lua insertArrow()<CR>', { noremap = true, silent = true })

-- Some shortcuts
vim.api.nvim_set_keymap('n', '<C-s>', ':w', { noremap = true, silent = true, desc = 'Save File' })
vim.api.nvim_set_keymap('n', '<C-S>', ':aw', { noremap = true, silent = true, desc = 'Save all files' })

-- small c conveniance gh to go to header
vim.api.nvim_set_keymap('n', 'gh', ':ClangdSwitchSourceHeader<CR>',
    { noremap = true, silent = true, desc = '[G]o to [h]eader or source' })

-- Normal esc in terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Enter terminal in insert mode automatically
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal and close buffer' })

-- Open terminal and enter insert mode
vim.keymap.set('n', '<leader>tt', ':bel term<CR>i', {
    noremap = true,
    silent = true,
    desc = '[T]oggle build-in [T]erminal'
})
