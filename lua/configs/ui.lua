require("gruvbox").setup({
    palette_overrides = {
        bright_green = "#ebdbb2",
    }
})
vim.cmd("colorscheme gruvbox")

current_theme = 1
local lualine_config = require('lualine').get_config()

function toggle_theme()
    current_theme = 3 - current_theme
    if current_theme == 1 then
        require("gruvbox").setup()
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox")
        lualine_config.theme = "gruvbox_dark"
        require('lualine').setup {
            options = lualine_config
        }
    elseif current_theme == 2 then
        require("gruvbox").setup()
        vim.o.background = "light"
        vim.cmd("colorscheme gruvbox")
        -- Background of extensions not properly set to light if not call two time
        require("gruvbox").setup({
            palette_overrides = {
                light0 = "#fbf6e5",
            }
        })
        vim.cmd("colorscheme gruvbox")
        lualine_config.theme = "gruvbox_light"
        require('lualine').setup {
            options = lualine_config
        }

    end
end

vim.api.nvim_set_keymap('n', '<leader>tq', ':lua toggle_theme()<CR>', { noremap = true, silent = true })


require("neo-tree").setup({
    window = {
          position = "left",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
    },
})

require("lualine").setup({
    options = {
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff',
            {
                'diagnostics',
                sources = { "nvim_diagnostic" },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
            }
        },
        lualine_c = { 'filename' },
        lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' }, -- I added copilot here
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})
