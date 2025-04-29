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
    -- install = {
    --     colorscheme = None
    -- },
})

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('racket_langserver')
vim.lsp.enable('ocamllsp')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
