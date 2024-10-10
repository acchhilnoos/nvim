return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "Recording @" .. recording_register
            end
        end
        require("lualine").setup({
            options = {
                icons_enabled = true,
                component_separators = "",
                section_separators = "",
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = { "filename" },
                lualine_b = { { "macro", fmt = show_macro_recording }, "diagnostics" },
                lualine_c = { "branch", "diff" },
                lualine_x = { {"filetype", icon_only = true} },
                lualine_y = { "os.date('%a %b %d %H:%M')" },
                lualine_z = { "location" },
            },
            extensions = {
                "fugitive",
                "fzf",
                "lazy",
                "mason",
                "oil"
            },
        })
        vim.api.nvim_create_autocmd("RecordingEnter", {
            callback = function()
                require("lualine").refresh({
                    place = { "statusline" },
                })
            end,
        })
        vim.api.nvim_create_autocmd("RecordingLeave", {
            callback = function()
                local timer = vim.loop.new_timer()
                timer:start(
                50,
                0,
                vim.schedule_wrap(function()
                    require("lualine").refresh({
                        place = { "statusline" },
                    })
                end)
                )
            end,
        })
    end,
}
