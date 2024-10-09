return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                component_separators = "|",
                section_separators = "",
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = { "filename" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "buffers" },
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
    end,
}
