-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'Search by Grep on Git Root' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })


local function telescope_live_grep_open_files()
  require('fzf-lua').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

vim.keymap.set('n', '<leader>/', telescope_live_grep_open_files, { desc = 'Grep in Open Files' })
vim.keymap.set('n', '<leader>sd', require('fzf-lua').diagnostics_document, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>ss', require('fzf-lua').builtin, { desc = 'Search Selector' })
vim.keymap.set('n', '<leader>sg', require('fzf-lua').grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<C-g>', require('fzf-lua').grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>sw', require('fzf-lua').grep_cword, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>w', require('fzf-lua').grep_cword, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sr', require('fzf-lua').resume, { desc = 'Search Resume' })
vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = 'Search Files' })
vim.keymap.set('n', '<C-f>', require('fzf-lua').files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sq', require('fzf-lua').quickfix, { desc = 'Search Quickfix' })
vim.keymap.set('n', '<leader>st', require('fzf-lua').tabs, { desc = 'Search Tabs' })
vim.keymap.set('n', '<leader>sF', require('fzf-lua').git_files, { desc = 'Search by Grep on Git Root' })
vim.keymap.set('n', '<leader>sh', require('fzf-lua').helptags, { desc = 'Search Help' })

-- Harpoon 2 is buggy on Windows | Uncomment this to use Harpoon 2
-- -- [Harpoon] Add custom telescope commands
-- local harpoon = require('harpoon')
-- harpoon:setup({})
--
-- -- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
--
-- vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })
