return {
    "Pocco81/true-zen.nvim",
    config = function()
        require("true-zen").setup({
            integrations = {
                kitty = { enabled = true, font = "+0" },
                twilight = true,
                lualine = true,
            },
            modes = {
                ataraxis = {
                    shade = "dark",
                    backdrop = 0,
                    minimum_writing_area = {
                        width = 90,
                        height = 44,
                    },
                    quit_untoggles = true,
                    padding = {
                        left = 30,
                        right = 20,
                        top = 0,
                        bottom = 0,
                    },
                    callbacks = {
                        open_pre = nil,
                        open_pos = nil,
                        close_pre = nil,
                        close_pos = nil
                    },
                },
            },
        })
    end,
}
