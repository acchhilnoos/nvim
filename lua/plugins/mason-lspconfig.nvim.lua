return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "jdtls",
                "lua_ls",
                "pyright",
            },
        })

        require("neodev").setup()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup(
                {}
                )
            end,
        })
    end,
}
