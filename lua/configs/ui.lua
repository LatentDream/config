require("gruvbox").setup({
    palette_overrides = {
        bright_green = "#ebdbb2",
    }
})
vim.cmd("colorscheme gruvbox")


require("neo-tree").setup({
    window = {
          position = "left",
          width = 25,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
    },
})


-- WIP - Lualine
-- require('lualine').setup {
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {
--       {
--         require("copilot.suggestion").is_visible() and '🚀 Copilot' or ''
--       },
--       'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
-- }
--
