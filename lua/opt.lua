---- VISUAL

-- CURSOR
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- LINE NUMBERS
vim.opt.nu = true
vim.opt.rnu = true

-- TABS/INDENTATION
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- SCROLL
vim.opt.scrolloff = 10

-- COLOURS
vim.opt.termguicolors = true

-- TRANSPARENCY
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("highlight Normal ctermbg=none")
vim.cmd("highlight NonText ctermbg=none")

-- CONCEALLEVEL
vim.opt.conceallevel = 0
-- vim.cmd([[
-- :autocmd BufEnter *.tex set conceallevel=0
-- ]])

vim.opt.showtabline = 0

-- HIGHLIGHT ON YANK
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.diagnostic.config({ virtual_text = { current_line = true, }, })

---- GENERAL

-- DISABLE MOUSE
vim.opt.mouse = ""

-- SEARCH
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- SIGNCOLUMN
vim.wo.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.completeopt = "menuone,noselect"

-- CLIPBOARD
vim.opt.clipboard = "unnamedplus"

-- UNDOFILE
vim.opt.undofile = true
