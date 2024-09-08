lazygit_term = nil
function lazygit_toggle()
    if vim.fn.executable('lazygit') == 1 then
        if lazygit_term and vim.api.nvim_buf_is_valid(lazygit_term) then
            -- If lazygit is already running, close it
            vim.api.nvim_buf_delete(lazygit_term, {force = true})
            lazygit_term = nil
        else
            -- Open lazygit in a new full-screen buffer
            vim.cmd('enew')
            lazygit_term = vim.api.nvim_get_current_buf()
            vim.fn.termopen("lazygit", {
                on_exit = function()
                    if vim.api.nvim_buf_is_valid(lazygit_term) then
                        vim.api.nvim_buf_delete(lazygit_term, {force = true})
                    end
                    lazygit_term = nil
                end
            })
            -- Hide the buffer from the buffer list and make it disposable
            vim.api.nvim_buf_set_option(lazygit_term, 'buflisted', false)
            vim.api.nvim_buf_set_option(lazygit_term, 'bufhidden', 'wipe')
            vim.cmd('startinsert')
        end
    else
        print("lazygit is not installed")
    end
end

-- Set the mapping
vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>lua lazygit_toggle()<CR>', { noremap = true, silent = true })
