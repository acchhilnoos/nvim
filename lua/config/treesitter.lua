return     {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "python",
                "latex",
                "markdown",
                "markdown_inline",
            },
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
