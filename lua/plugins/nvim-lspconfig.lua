return {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    { "j-hui/fidget.nvim", opts = { notification = { window = { winblend = 0 }, }, }, },
	    "folke/neodev.nvim",
	},
}
