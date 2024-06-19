return {
  { "nvim-tree/nvim-web-devicons" },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox_dark',
        component_separators = '|',
        section_separators = '',
      },
    },
  }
}
