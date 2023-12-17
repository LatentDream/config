-- Make compatible with current tab keybindings
vim.cmd[[imap <silent><scfript><expr> <C-a> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

vim.cmd[[highlight CopilotTab guifg=#555555 ctermfg=8]]


