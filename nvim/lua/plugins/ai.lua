local function check_user()
    local handle = io.popen("whoami")
    local result = ""
    if handle then
        result = handle:read("*a"):gsub("%s+$", "") -- Remove trailing whitespace/newline
        handle:close()
    end
    return result
end

-- Only return plugins if not work computer
if check_user() ~= "guillaume.thibault" then
    return {
        {
            -- https://github.com/yetone/avante.nvim
            "yetone/avante.nvim",
            event = "VeryLazy",
            lazy = false,
            opts = {
                provider = "claude",
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-3-5-sonnet-20240620",
                    temperature = 0,
                    max_tokens = 4096,
                },
                behaviour = {
                    auto_suggestions = false,
                    auto_set_highlight_group = true,
                    auto_set_keymaps = true,
                    auto_apply_diff_after_generation = false,
                    support_paste_from_clipboard = false,
                },
            },
            build = ":AvanteBuild",
            dependencies = {
                "stevearc/dressing.nvim",
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                "nvim-tree/nvim-web-devicons",
                {
                    "HakonHarnes/img-clip.nvim",
                    event = "VeryLazy",
                    opts = {
                        -- recommended settings
                        default = {
                            embed_image_as_base64 = false,
                            prompt_for_file_name = false,
                            drag_and_drop = {
                                insert_mode = true,
                            },
                            -- required for Windows users
                            use_absolute_path = true,
                        },
                    },
                },
                {
                    'MeanderingProgrammer/render-markdown.nvim',
                    opts = {
                        file_types = { "markdown", "Avante" },
                    },
                    ft = { "markdown", "Avante" },
                },
            },
        },
        {
            "supermaven-inc/supermaven-nvim",
            config = function()
                require("supermaven-nvim").setup({
                    disable_inline_completion = true,
                    disable_keymaps = true
                })
            end,
        },
    }
else
    return {} -- Return empty table when user is guillaume.thibault
end
