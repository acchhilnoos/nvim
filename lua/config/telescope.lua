return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy  = true,
                }
            }
        })
        pcall(require("telescope").load_extension, "fzf")
    end,
}
