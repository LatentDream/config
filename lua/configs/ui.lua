require("gruvbox").setup({
    palette_overrides = {
        bright_green = "#ebdbb2",
    }
})
vim.cmd("colorscheme gruvbox")

current_theme = 1

function toggle_theme()
    current_theme = 3 - current_theme
    if current_theme == 1 then
        require("gruvbox").setup()
        vim.cmd("colorscheme gruvbox")
    elseif current_theme == 2 then
        require("gruber-darker").setup()
        vim.cmd("colorscheme gruber-darker")
    end
end

vim.api.nvim_set_keymap('n', '<leader>tt', ':lua toggle_theme()<CR>', { noremap = true, silent = true })


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
