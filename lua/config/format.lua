return {
    {
        "williamboman/mason.nvim",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    {
        "jay-babu/mason-null-ls.nvim",
        config = function()
            require("mason").setup()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "clang_format",
                    "latexindent",
                    "stylua",
                },
            })
        end,
    },
}
