-- [[ Configure LSP ]]
-- Main config are in ../configs/lsp.lua

-- Some utilities
vim.keymap.set("n", "<leader>ls", ':LspStart<cr>', { desc = '[L]sp [s]tart' })
vim.keymap.set("n", "<leader>lp", ':LspStop<cr>', { desc = '[L]sp [p]pause' })
vim.keymap.set("n", "<leader>lr", ':LspRestart<cr>', { desc = '[L]sp [r]estart' })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Format<CR>', { noremap = true, silent = true })

-- document existing key chains
local wk = require("which-key")
wk.add({
  { "<leader>b",  group = "[B]uffer" },
  { "<leader>b_", hidden = true },
  { "<leader>c",  group = "[C]ode" },
  { "<leader>c_", hidden = true },
  { "<leader>d",  group = "[D]ocument" },
  { "<leader>d_", hidden = true },
  { "<leader>f",  group = "[F]ile" },
  { "<leader>f_", hidden = true },
  { "<leader>g",  group = "[G]it" },
  { "<leader>g_", hidden = true },
  { "<leader>i",  group = "[I]nsert" },
  { "<leader>i_", hidden = true },
  { "<leader>r",  group = "[R]ename" },
  { "<leader>r_", hidden = true },
  { "<leader>s",  group = "[S]earch" },
  { "<leader>s_", hidden = true },
  { "<leader>t",  group = "[T]oggle" },
  { "<leader>t_", hidden = true },
  { "<leader>w",  group = "[W]orkspace" },
  { "<leader>w_", hidden = true },
  { "<leader>x",  group = "[X]Error" },
  { "<leader>x_", hidden = true },
  { "<leader>",   group = "VISUAL <leader>", mode = "v" },
})
