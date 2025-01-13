return {
    "mhartington/formatter.nvim",
    config = function()
        require("formatter").setup {
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                cpp = {
                    require("formatter.filetypes.cpp").clang_format,
                },

                ocaml = {
                    require("formatter.filetypes.ocaml").ocamlformat,
                },

                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                }
            }
        }
    end,
}
