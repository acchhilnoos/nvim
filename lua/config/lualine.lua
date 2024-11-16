local palette = {
    text = "#e0def4",
    _nc = "#1f1d30",
    love = "#eb6f92",
    gold = "#f6c177",
    rose = "#ea9a97",
    pine = "#3e8fb0",
    foam = "#9ccfd8",
    iris = "#c4a7e7",
    leaf = "#95b1ac",
    none = "NONE",
}
local colors = {
    normal = {
        a = {bg = palette.love, fg = palette._nc, gui = "bold"},
        b = {bg = palette.none, fg = palette.rose},
        c = {bg = palette.none, fg = palette.none},
        y = {bg = palette.none, fg = palette.text},
    },
    insert = {
        a = {bg = palette.pine, fg = palette._nc, gui = "bold"},
        b = {bg = palette.none, fg = palette.rose},
        c = {bg = palette.none, fg = palette.none},
        y = {bg = palette.none, fg = palette.text},
    },
    visual = {
        a = {bg = palette.iris, fg = palette._nc, gui = "bold"},
        b = {bg = palette.none, fg = palette.rose},
        c = {bg = palette.none, fg = palette.none},
        y = {bg = palette.none, fg = palette.text},
    },
    replace = {
        a = {bg = palette.leaf, fg = palette._nc, gui = "bold"},
        b = {bg = palette.none, fg = palette.rose},
        c = {bg = palette.none, fg = palette.none},
        y = {bg = palette.none, fg = palette.text},
    },
    command = {
        a = {bg = palette.gold, fg = palette._nc, gui = "bold"},
        b = {bg = palette.none, fg = palette.rose},
        c = {bg = palette.none, fg = palette.none},
        y = {bg = palette.none, fg = palette.text},
    },
    inactive = {
        c = {bg = palette.none, fg = palette.text},
    },
}
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
                theme = colors,
            },
            sections = {
                lualine_a = { "filename" },
                lualine_b = { { "macro", fmt = show_macro_recording }, "diagnostics" },
                lualine_c = { "branch", "diff" },
                lualine_x = { {"filetype", icon_only = true} },
                lualine_y = { "os.date('%a %b %d %H:%M')" },
                lualine_z = { "location", "progress" },
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
