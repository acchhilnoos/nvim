return {
    {
        "williamboman/mason.nvim",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("mason").setup()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.clang_format,
                    require("null-ls").builtins.formatting.latexindent,
                    require("null-ls").builtins.formatting.stylua,
                },
            })
        end,
    },
}
