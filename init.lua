-- OPTS
vim.o.mouse = ''
vim.o.mousescroll = 'ver:0,hor:0'

vim.o.cot  = 'menuone,noselect,popup'
vim.o.et   = true
vim.o.ic   = true
vim.o.nu   = true
vim.o.rnu  = true
vim.o.scl  = 'yes'
vim.o.scs  = true
vim.o.so   = 8
vim.o.stal = 0
vim.o.sts  = 2
vim.o.sw   = 2
vim.o.ts   = 8
vim.o.udf  = true
vim.o.wrap = false

-- COLOURS
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({})
  end,
})

-- PLUGINS
vim.pack.add({
   { src = 'https://github.com/mhartington/formatter.nvim' },
   { src = 'https://github.com/ggandor/leap.nvim' },
   { src = 'https://github.com/echasnovski/mini.nvim.git' },
   { src = 'https://github.com/neovim/nvim-lspconfig' },
   { src = "https://github.com/stevearc/oil.nvim.git" },
})

require('formatter').setup({
  filetype = {
    c = {
      require('formatter.filetypes.c').clangformat,
    },
    cpp = {
      require('formatter.filetypes.cpp').clangformat,
    },
    ocaml = {
      require('formatter.filetypes.ocaml').ocamlformat,
    },
    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
})

require('mini.align').setup()
require('mini.pick').setup()

require('oil').setup({
  keymaps = {
    [''] = { 'actions.close', mode = 'n' },
  },
  view_options = {
    show_hidden = true,
  },
  float = {
    preview_split = 'right',
  },
})

-- LSP
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ocamllsp')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- KEYMAPS
vim.g.mapleader = ' '

vim.keymap.set({'n'}, '<leader>q',   ':update<CR>:q<CR>')
vim.keymap.set({'n'}, '<leader>w',   ':w<CR>')
vim.keymap.set({'n'}, '<leader>rc',  ':so ~/.config/nvim/init.lua<CR>')

vim.keymap.set({'n'}, '<leader>df',  ':FormatWrite<CR>')

vim.keymap.set({'n'}, '<leader>oo',  ':lua require("oil").open_float()<CR>')

vim.keymap.set({'n'}, '<leader> ',   ':Pick buffers<CR>')
vim.keymap.set({'n'}, '<leader>/',   ':Pick files<CR>')
vim.keymap.set({'n'}, '<leader>?',   ':Pick grep_live<CR>')

vim.keymap.set({'n'}, '<leader>d',   vim.diagnostic.open_float)
vim.keymap.set({'n'}, '<leader>h',   function() vim.lsp.buf.hover({ border = 'rounded' }) end)

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set({'n'}, 'S',           function() require('leap.remote').action() end)

vim.cmd.noremap('<',     '<gv')
vim.cmd.noremap('>',     '>gv')
vim.cmd.noremap('#',     '#zz')
vim.cmd.noremap('*',     '*zz')
vim.cmd.noremap('<C-d>', '<C-d>zz')
vim.cmd.noremap('<C-i>', '<C-i>zz')
vim.cmd.noremap('<C-o>', '<C-o>zz')
vim.cmd.noremap('<C-u>', '<C-u>zz')
