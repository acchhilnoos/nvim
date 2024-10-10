local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("opt")
require("lazy").setup({
    spec = {
        -- all LSP functionality is in lsp.lua
        -- all keymaps are in remap.lua
        { import = "config" },
    },
    install = {
        colorscheme = None
    },
})
print("Load complete.")
