return {
  {
    "mbbill/undotree",
    lazy = false, -- needs to be explicitly set, because of the keys property
    keys = {
      {
        "<leader>u",
        vim.cmd.UndotreeToggle,
        desc = "Toggle undotree",
      },
    },
  }
}
