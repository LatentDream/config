return   {
    "ellisonleao/gruvbox.nvim",
    priority = 10000,
    lazy = false,
    config = function()
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_background = "medium"
      vim.cmd.colorscheme("gruvbox")
    end,
}
