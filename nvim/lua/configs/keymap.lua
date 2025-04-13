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
    { noremap = true, silent = true, desc = 'Toggle Highlight Search' })

-- Custom insert
function insertArrow()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i →", true, true, true), 'n', true)
end

vim.api.nvim_set_keymap('n', '<leader>ia', ':lua insertArrow()<CR>', { noremap = true, silent = true })

-- Function to insert error handling
vim.keymap.set('n', '<leader>ie', function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local line = pos[1] - 1
    vim.api.nvim_buf_set_lines(0, line, line, false, {
        "if err != nil {",
        "\t",
        "}"
    })
    -- Move cursor to the indented line
    vim.api.nvim_win_set_cursor(0, { line + 2, 1 })
end)

-- Some shortcuts
vim.api.nvim_set_keymap('n', '<C-s>', ':w', { noremap = true, silent = true, desc = 'Save File' })
vim.api.nvim_set_keymap('n', '<C-S>', ':aw', { noremap = true, silent = true, desc = 'Save all files' })

-- small c conveniance gh to go to header
vim.api.nvim_set_keymap('n', 'gh', ':ClangdSwitchSourceHeader<CR>',
    { noremap = true, silent = true, desc = 'Go to header or source' })

-- Normal esc in terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Enter terminal in insert mode automatically
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal and close buffer' })

-- Open terminal and enter insert mode
vim.keymap.set('n', '<leader>tt', ':bel term<CR>i', {
    noremap = true,
    silent = true,
    desc = 'Toggle build-in Terminal'
})
