-- Harpoon 2 is buggy on Windows | Uncomment this to use Harpoon 2
-- local harpoon = require("harpoon")
--
-- -- REQUIRED
-- harpoon:setup()
-- -- REQUIRED
--
-- vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
-- vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-hq>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-hw>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-he>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-hr>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-H-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-H-N>", function() harpoon:list():next() end)

-- Harpoon 1 config fall back | Delete this if you use Harpoon 2
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local harpoon = require("harpoon")

-- Your existing keybindings
vim.keymap.set("n", "<leader>j", mark.add_file, { desc = '[H]arpoon [A]add file'})
vim.keymap.set("n", "<leader>k", ui.toggle_quick_menu, { desc = '[H]arpoon Explorer'})
vim.keymap.set("n", "<leader>hn", function() ui.nav_file(1) end, { desc = '[H]arpoon 1'})
vim.keymap.set("n", "<leader>hm", function() ui.nav_file(2) end, { desc = '[H]arpoon 2'})
vim.keymap.set("n", "<leader>h,", function() ui.nav_file(3) end, { desc = '[H]arpoon 3'})
vim.keymap.set("n", "<leader>h.", function() ui.nav_file(4) end, { desc = '[H]arpoon 4'})

-- Add navigation with Shift+H and Shift+L
vim.keymap.set("n", "H", function()
    -- Navigate to previous file in list
    ui.nav_prev()
end, { desc = 'Harpoon Previous' })

vim.keymap.set("n", "L", function()
    -- Navigate to next file in list
    ui.nav_next()
end, { desc = 'Harpoon Next' })
