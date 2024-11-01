return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup()
        require("mini.align").setup()
        local starter = require("mini.starter")
        starter.setup({
            items = {
                starter.sections.recent_files(5, true, false),
                starter.sections.recent_files(10, false, false),
                { name = "Config",     action = "vi ~/.config/nvim",               section = "Actions" },
                { name = "Finder",     action = "lua require('oil').open_float()", section = "Actions" },
                { name = "Lazy",       action = "Lazy",                            section = "Actions" },
                { name = "New buffer", action = "enew",                            section = "Actions" },
                { name = "Quit",       action = "qall",                            section = "Actions" },
            },
            content_hooks = {
                starter.gen_hook.indexing('all', { 'Actions' }),
                starter.gen_hook.aligning('center', 'center'),
            },
            footer = "",
        })
        local hipatterns = require("mini.hipatterns")
        hipatterns.setup({
            highlighters = {
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })
    end,
}
