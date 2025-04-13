-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Line number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab confit
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true


-- Function to toggle colorcolumn
function toggle_colorcolumn()
  if vim.wo.colorcolumn == "" then
    vim.wo.colorcolumn = "89"
  else
    vim.wo.colorcolumn = ""
  end
end

-- Set up a keymap to toggle colorcolumn
vim.api.nvim_set_keymap('n', '<leader>tc', ':lua toggle_colorcolumn()<CR>',
  { noremap = true, silent = true, desc = 'Toggle colorcolumn' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Resize window using <Ctrl> arrow keys
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>',
  { noremap = true, silent = true, desc = 'Increase window height' })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>',
  { noremap = true, silent = true, desc = 'Decrease window height' })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>',
  { noremap = true, silent = true, desc = 'Decrease window width' })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>',
  { noremap = true, silent = true, desc = 'Increase window width' })

-- Move between windows
vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>',
  { noremap = true, silent = true, desc = 'Move to the left window' })
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>',
  { noremap = true, silent = true, desc = 'Move to the down window' })
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>',
  { noremap = true, silent = true, desc = 'Move to the up window' })
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>',
  { noremap = true, silent = true, desc = 'Move to the right window' })
vim.api.nvim_set_keymap('n', '<C-\\>', ':TmuxNavigatePrevious<CR>',
  { noremap = true, silent = true, desc = 'Move to the previous window' })

-- Custom insert
function insertArrow()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i →", true, true, true), 'n', true)
end

vim.api.nvim_set_keymap('n', '<leader>ia', ':lua insertArrow()<CR>', { noremap = true, silent = true })

-- Some shortcuts
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = 'Save File' })
vim.api.nvim_set_keymap('n', '<C-S>', ':aw<CR>', { noremap = true, silent = true, desc = 'Save all files' })
vim.api.nvim_set_keymap('n', '<leader>p', ':put! =@0<CR>', { noremap = true, silent = true, desc = 'Paste' })
vim.api.nvim_set_keymap('v', '<leader>p', ':put! =@0<CR>', { noremap = true, silent = true, desc = 'Paste' })

-- Remap the :make -> justfile
vim.o.makeprg = 'just'
vim.api.nvim_create_user_command('Just', function(opts)
  vim.cmd('make ' .. opts.args)
end, { nargs = '*' })

vim.keymap.set('n', '<leader>jj', ':!just<CR>', { noremap = true, silent = true, desc = 'justfile' })
vim.keymap.set('n', '<leader>jl', ':!just --list<CR>', { noremap = true, silent = true, desc = 'Justfile list' })
vim.keymap.set('n', '<leader>jb', ':!just build<CR>', { noremap = true, silent = true, desc = 'justfile build' })
vim.keymap.set('n', '<leader>m', ':make build<CR>', { noremap = true, silent = true, desc = 'make build' })
