-- OPTS
vim.o.mouse = ''

vim.o.cot       = ''        -- completeopt
vim.o.et        = true      -- expandtab
vim.o.ic        = true      -- ignorecase
vim.o.nu        = true      -- number
vim.o.rnu       = true      -- relativenumber
vim.o.scl       = 'yes'     -- signcolumn
vim.o.scs       = true      -- smartcase
vim.o.so        = 8         -- scrolloff
vim.o.stal      = 0         -- showtabline
vim.o.sts       = 2         -- softtabstop
vim.o.sw        = 2         -- shiftwidth
vim.o.swf       = false     -- swapfile
vim.o.tgc       = true      -- termguicolors
vim.o.ts        = 8         -- tabstop
vim.o.udf       = true      -- undofile
vim.o.wrap      = false     -- wrap
vim.o.winborder = 'rounded' -- winborder

vim.diagnostic.config({underline = true, virtual_text = { current_line = true, }})

-- PLUGINS
vim.pack.add({
   { src = 'https://github.com/saghen/blink.cmp' },
   { src = 'https://github.com/slugbyte/lackluster.nvim' },
   { src = 'https://github.com/mhartington/formatter.nvim' },
   { src = 'https://github.com/ggandor/leap.nvim' },
   { src = 'https://github.com/echasnovski/mini.nvim.git' },
   { src = 'https://github.com/neovim/nvim-lspconfig' },
   { src = "https://github.com/stevearc/oil.nvim.git" },
})

require('formatter').setup({
  filetype = {
    c     = { require('formatter.filetypes.c')    .clangformat, },
    cpp   = { require('formatter.filetypes.cpp')  .clangformat, },
    ocaml = { require('formatter.filetypes.ocaml').ocamlformat, },
    ['*'] = { require('formatter.filetypes.any')  .remove_trailing_whitespace, },
  },
})

require('mini.align')      .setup()
require('mini.indentscope').setup()
require('mini.pick')       .setup()

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

require('blink.cmp').setup({
  keymap = {
    ['<C-e>'] = { 'select_prev', 'fallback' },
    ['<Tab>'] = { 'accept' },
  },
  completion = { documentation = { auto_show = true }}
})
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })

-- COLOURS
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({})
  end,
})

vim.cmd('colorscheme lackluster-mint')

vim.cmd('hi BlinkCmpMenuBorder guibg=NONE')
vim.cmd('hi @comment           guifg=#7a7a7a')
vim.cmd('hi Comment            guifg=#7a7a7a')
vim.cmd('hi FloatBorder        guifg=#8ea49e guibg=NONE')
vim.cmd('hi FloatTitle         guibg=NONE')
vim.cmd('hi FloatFooter        guibg=NONE')
vim.cmd('hi MsgArea            guibg=NONE')
vim.cmd('hi Normal             guibg=NONE')
vim.cmd('hi NormalFloat        guibg=NONE')
vim.cmd('hi Pmenu              guifg=NONE guibg=NONE')
vim.cmd('hi PmenuKind          guifg=#54546d')
vim.cmd('hi PmenuKindSel       guifg=#54546d')
vim.cmd('hi PmenuExtra         guibg=NONE')
vim.cmd('hi SignColumn         guibg=NONE')
vim.cmd('hi StatusLine         guibg=NONE')
vim.cmd('hi StatusLine         guifg=NONE')
vim.cmd('hi StatusLineNC       guibg=NONE')

-- KEYMAPS
vim.g.mapleader = ' '

vim.keymap.set({'n'}, '<leader>q', ':update<CR>:q<CR>')
vim.keymap.set({'n'}, '<leader>w', ':w<CR>')
vim.keymap.set({'n'}, '<leader>rc',':so ~/.config/nvim/init.lua<CR>')

vim.keymap.set({'n'}, '<leader>df',':FormatWrite<CR>')

vim.keymap.set({'n'}, '<leader>oo',':lua require("oil").open_float()<CR>')

vim.keymap.set({'n'}, '<leader> ', ':Pick buffers<CR>')
vim.keymap.set({'n'}, '<leader>/', ':Pick files<CR>')
vim.keymap.set({'n'}, '<leader>.', ':Pick help<CR>')
vim.keymap.set({'n'}, '<leader>?', ':Pick grep_live<CR>')

vim.keymap.set({'n'}, '<leader>d', vim.diagnostic.open_float)
vim.keymap.set({'n'}, '<leader>h', vim.lsp.buf.hover)

vim.keymap.set({'n','x','o'}, 's', '<Plug>(leap)')
vim.keymap.set({'n'}, 'S',         function() require('leap.remote').action() end)

vim.cmd.noremap('<',     '<gv')
vim.cmd.noremap('>',     '>gv')
vim.cmd.noremap('#',     '#zz')
vim.cmd.noremap('*',     '*zz')
vim.cmd.noremap('<C-d>', '<C-d>zz')
vim.cmd.noremap('<C-i>', '<C-i>zz')
vim.cmd.noremap('<C-o>', '<C-o>zz')
vim.cmd.noremap('<C-u>', '<C-u>zz')
