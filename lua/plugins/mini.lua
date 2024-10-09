return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup()
        require("mini.align").setup()
        local starter = require("mini.starter")
        starter.setup({
            items = {
                starter.sections.recent_files(5,true,false),
                starter.sections.recent_files(5,false,false),
                {name = "File explorer", action = "Oil",  section = "Actions"},
                {name = "New buffer",    action = "enew", section = "Actions"},
                {name = "Quit",          action = "qall", section = "Actions"},
            },
            content_hooks = {
                starter.gen_hook.indexing('all', { 'Actions' }),
                starter.gen_hook.aligning('center', 'center'),
            },
            footer = "",
        })
    end,
}
