local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-hq>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-hw>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-he>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-hr>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-H-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-H-N>", function() harpoon:list():next() end)
