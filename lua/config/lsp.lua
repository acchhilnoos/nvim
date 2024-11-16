return {
    {
        "williamboman/mason.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                opts = {
                    notification = {
                        window = {
                            winblend = 0,
                        },
                    },
                },
            },
            "folke/neodev.nvim",
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "jdtls",
                    "lua_ls",
                    "marksman",
                    "pyright",
                    "rust_analyzer",
                },
            })
            require("lspconfig").racket_langserver.setup({
                cmd = { "/Applications/Racket v8.14/bin/racket", "--lib", "racket-langserver" },
            })
            require("neodev").setup()
        end,
    }
}
