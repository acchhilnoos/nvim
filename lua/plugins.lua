return{
    "ggandor/leap.nvim",
    "knubie/vim-kitty-navigator",
    "lervag/vimtex",
    "mbbill/undotree",
    "Pocco81/true-zen.nvim",
    "rcarriga/nvim-notify",
    "sbdchd/neoformat",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",
    { "echasnovski/mini.nvim", version = false },
    { "folke/twilight.nvim", opts = {} },
    { "folke/which-key.nvim", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "rose-pine/neovim", name = "rose-pine" },
    {
	"epwalsh/obsidian.nvim",
	version = "*",  -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
	    -- Required.
	    "nvim-lua/plenary.nvim",

	    -- see below for full list of optional dependencies 👇
	},
    },
    {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
	},
	dependencies = {
	    "MunifTanjim/nui.nvim",
	    "rcarriga/nvim-notify",
	},
    },
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "L3MON4D3/LuaSnip",
	    "saadparwaiz1/cmp_luasnip",
	    "hrsh7th/cmp-nvim-lsp",
	    "rafamadriz/friendly-snippets",
	},
    },
    {
	"lewis6991/gitsigns.nvim",
	opts = {
	    signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	    },
	    on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local function map(mode, l, r, opts)
		    opts = opts or {}
		    opts.buffer = bufnr
		    vim.keymap.set(mode, l, r, opts)
		end
		map({ "n", "v" }, "]c", function()
		    if vim.wo.diff then
			return "]c"
		    end
		    vim.schedule(function()
			gs.next_hunk()
		    end)
		    return "<Ignore>"
		end, { expr = true, desc = "Jump to next hunk" })
		map({ "n", "v" }, "[c", function()
		    if vim.wo.diff then
			return "[c"
		    end
		    vim.schedule(function()
			gs.prev_hunk()
		    end)
		    return "<Ignore>"
		end, { expr = true, desc = "Jump to previous hunk" })
		map("v", "<leader>hs", function()
		    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "stage git hunk" })
		map("v", "<leader>hr", function()
		    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "reset git hunk" })
		map("n", "<leader>hs", gs.stage_hunk, { desc = "git stage hunk" })
		map("n", "<leader>hr", gs.reset_hunk, { desc = "git reset hunk" })
		map("n", "<leader>hS", gs.stage_buffer, { desc = "git Stage buffer" })
		map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
		map("n", "<leader>hR", gs.reset_buffer, { desc = "git Reset buffer" })
		map("n", "<leader>hp", gs.preview_hunk, { desc = "preview git hunk" })
		map("n", "<leader>hb", function()
		    gs.blame_line({ full = false })
		end, { desc = "git blame line" })
		map("n", "<leader>hd", gs.diffthis, { desc = "git diff against index" })
		map("n", "<leader>hD", function()
		    gs.diffthis("~")
		end, { desc = "git diff against last commit" })
		map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "toggle git blame line" })
		map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle git show deleted" })
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select git hunk" })
	    end,
	},
    },
    {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
    },
    {
	"OXY2DEV/markview.nvim",
	lazy = false,      -- Recommended
	-- ft = "markdown" -- If you decide to lazy-load anyway

	dependencies = {
	    -- You will not need this if you installed the
	    -- parsers manually
	    -- Or if the parsers are in your $RUNTIMEPATH
	    "nvim-treesitter/nvim-treesitter",

	    "nvim-tree/nvim-web-devicons"
	}
    },
    {
      "supermaven-inc/supermaven-nvim",
    },
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    { "j-hui/fidget.nvim", opts = {} },
	    "folke/neodev.nvim",
	},
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
	    "nvim-lua/plenary.nvim",
	    {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
		    return vim.fn.executable("make") == 1
		end,
	    },
	},
    },
    {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
	    "nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
    },
    {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
