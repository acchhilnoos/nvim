return {
    "sho-87/kanagawa-paper.nvim",
    priority = 1000,
    config = function()
        require('kanagawa-paper').setup({
            undercurl = true,
            transparent = true,
            gutter = false,
            dimInactive = false,
            terminalColors = true,
            commentStyle = { italic = true },
            functionStyle = { italic = true },
            keywordStyle = { italic = false, bold = false },
            statementStyle = { italic = false, bold = false },
            typeStyle = { italic = false },
            colors = { theme = {}, palette = {} },
            overrides = function()
                return {}
            end,
        })
        vim.cmd("colorscheme kanagawa-paper")
        vim.cmd("hi StatusLine guibg=NONE")
        vim.cmd("hi StatusLine guifg=NONE")
        vim.cmd("hi StatusLineNC guibg=NONE")
        vim.cmd("hi NormalFloat guibg=NONE")
        vim.cmd("hi TelescopePreviewNormal guibg=NONE")
        vim.cmd("hi TelescopePromptNormal guibg=NONE")
        vim.cmd("hi TelescopeResultsNormal guibg=NONE")
        vim.cmd("hi TelescopePreviewBorder guibg=NONE")
        vim.cmd("hi TelescopePromptBorder guibg=NONE")
        vim.cmd("hi TelescopeResultsBorder guibg=NONE")
    end,
    -- "rose-pine/neovim",
    -- name = "rose-pine",
    -- config = function()
    --     require("rose-pine").setup({
    --         variant = "moon",
    --         styles = {
    --             transparency = true,
    --         },
    --     })
    --     vim.cmd("colorscheme rose-pine")
    -- end,
}
