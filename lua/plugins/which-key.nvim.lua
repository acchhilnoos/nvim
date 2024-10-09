return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key").setup()

        -- WRITE/QUIT
        vim.keymap.set("n", "<leader>w", ":w<CR>")

        -- INDENT
        vim.cmd.vnoremap("<", "<gv")
        vim.cmd.vnoremap(">", ">gv")

        -- WINDOWS
        vim.keymap.set("n", "<leader>H", ":vsplit<CR>")
        vim.keymap.set("n", "<leader>J", ":split <BAR> :wincmd j<CR>")
        vim.keymap.set("n", "<leader>K", ":split<CR>")
        vim.keymap.set("n", "<leader>L", ":vsplit <BAR> :wincmd l<CR>")

        -- SCROLL
        vim.cmd.nnoremap("<C-d>", "<C-d>zz")
        vim.cmd.nnoremap("<C-u>", "<C-u>zz")

        ---- PLUGIN
        
        -- oil.nvim
        vim.keymap.set("n", "<leader>pv", "<cmd>lua require('oil').open_float()<CR>")
        vim.keymap.set("n", "<leader>pf", "<cmd>lua require('oil').open()<CR>")

        -- true-zen.nvim
        vim.keymap.set("n", "<leader>zf", ":TZAtaraxis<CR>", {})
        vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", {})
    end,
}
