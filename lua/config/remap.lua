return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup()

        ---- GENERAL

        --- RELOAD CONFIG
        wk.add({ "<leader>rc", ":luafile ~/.config/nvim/init.lua<CR>", desc = "[R]eload [C]onfig" })

        -- WRITE/QUIT
        wk.add({ "<leader>w", ":w<CR>", desc = "[W]rite" })
        wk.add({ "<leader>wq", ":wq<CR>", desc = "[W]rite [Q]uit" })

        -- FORMAT
        wk.add({ "<leader>df", ":FormatWrite<CR>", desc = "[D]ocument [F]ormat" })

        -- WINDOWS
        wk.add({ "<C-w>H", ":vsplit<CR>", hidden = true })
        wk.add({ "<C-w>J", ":split <BAR> :wincmd j<CR>", hidden = true })
        wk.add({ "<C-w>K", ":split<CR>", hidden = true })
        wk.add({ "<C-w>L", ":vsplit <BAR> :wincmd l<CR>", hidden = true })

        -- MOVEMENT
        vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
        vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
        vim.cmd.nnoremap("<C-d>", "<C-d>zz")
        vim.cmd.nnoremap("<C-i>", "<C-i>zz")
        vim.cmd.nnoremap("<C-o>", "<C-o>zz")
        vim.cmd.nnoremap("<C-u>", "<C-u>zz")
        vim.cmd.nnoremap("#", "#zz")
        vim.cmd.nnoremap("*", "*zz")

        -- INDENT
        vim.cmd.vnoremap("<", "<gv")
        vim.cmd.vnoremap(">", ">gv")

        -- DIAGNOSTICS
        wk.add({ "<leader>fd", vim.diagnostic.open_float, desc = "[F]loating [D]iagnostics" })

        ---- PLUGIN

        wk.add({
            { "<leader>c",  group = "[C]ode" },
            { "<leader>c_", hidden = true },
            { "<leader>d",  group = "[D]ocument" },
            { "<leader>d_", hidden = true },
            { "<leader>f",  group = "[F]loating" },
            { "<leader>f_", hidden = true },
            { "g",          group = "[G]oto" },
            { "g_",         hidden = true },
            { "<leader>g",  group = "[G]it" },
            { "<leader>g_", hidden = true },
            { "<leader>l",  desc = "Vimtex" },
            { "<leader>l_", hidden = true },
            -- { "<leader>n",  desc = "[N]oice" },
            -- { "<leader>n_", hidden = true },
            { "<leader>o",  desc = "[O]pen" },
            { "<leader>o_", hidden = true },
            { "<leader>r",  group = "[R]e-" },
            { "<leader>r_", hidden = true },
            { "<leader>s",  group = "[S]urround" },
            { "<leader>s_", hidden = true },
            { "<leader>t",  group = "[T]oggle" },
            { "<leader>t_", hidden = true },
            { "<leader>w",  group = "[W]rite" },
            { "<leader>w_", hidden = true },
            { "<leader>W",  group = "[W]orkspace" },
            { "<leader>W_", hidden = true },
        })

        -- cmp
        -- local cmp = require("cmp")
        -- local luasnip = require("luasnip")
        -- cmp.setup({
        --     mapping = cmp.mapping.preset.insert({
        --         ["<C-j>"]   = cmp.mapping.select_next_item(),
        --         ["<C-k>"]   = cmp.mapping.select_prev_item(),
        --         ["<CR>"]    = cmp.mapping.confirm({
        --             behavior = cmp.ConfirmBehavior.Replace,
        --             select   = true,
        --         }),
        --         ["<Tab>"]   = cmp.mapping(function(fallback)
        --             if cmp.visible() then
        --                 cmp.select_next_item()
        --             elseif luasnip.expand_or_locally_jumpable() then
        --                 luasnip.expand_or_jump()
        --             else
        --                 fallback()
        --             end
        --         end, { "i", "s" }),
        --         ["<S-Tab>"] = cmp.mapping(function(fallback)
        --             if cmp.visible() then
        --                 cmp.select_prev_item()
        --             elseif luasnip.locally_jumpable(-1) then
        --                 luasnip.jump(-1)
        --             else
        --                 fallback()
        --             end
        --         end, { "i", "s" }),
        --     }),
        -- })

        -- fugitive
        -- wk.add({ "<leader>gg", ":Git<CR>", desc = "[G]it [G]it" })
        -- wk.add({ "<leader>gd", ":Git diff<CR>", desc = "[G]it [D]iff" })

        -- gitsigns
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local blame_line = function()
                    gs.blame_line({ full = false })
                end
                wk.add({ "<leader>fb", blame_line, desc = "[F]loating [B]lame" })
                wk.add({ "<leader>tb", gs.toggle_current_line_blame, desc = "[T]oggle git [B]lame" })
                wk.add({ "<leader>td", gs.toggle_deleted, desc = "[T]oggle git [D]eleted" })
                wk.add({ "<leader>fh", gs.preview_hunk, desc = "[F]loating [H]unk Preview" })
            end,
        })

        -- leap
        wk.add({ "<C-s>", "<Plug>(leap-forward)", desc = "leap forward", hidden = true })
        wk.add({ "<C-S-s>", "<Plug>(leap-backward)", desc = "leap backward", hidden = true })

        -- noice
        -- wk.add({ "<leader>nd", ":Noice dismiss<CR>", desc = "[N]oice [D]ismiss" })
        -- wk.add({ "<leader>nl", ":Noice last<CR>", desc = "[N]oice [L]ast" })
        -- wk.add({ "<leader>nt", ":Noice telescope<CR>", desc = "[N]oice [T]elescope" })

        -- obsidian
        -- wk.add({ "<leader>oo", ":ObsidianOpen<CR>", desc = "[O]pen [O]bsidian" })

        -- oil
        wk.add({ "<leader>pv", ":lua require('oil').open_float()<CR>", hidden = true })

        -- supermaven
        -- require("supermaven-nvim").setup({
        --     keymaps = {
        --         accept_suggestion = "<C-Space>",
        --         accept_word       = "<C-l>",
        --     },
        -- })
        -- wk.add({ "<leader>ts", ":SupermavenToggle<CR>", desc = "[T]oggle [S]upermaven" })

        -- telescope
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
        })

        local tbi = require("telescope.builtin")
        local find = function()
            tbi.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 0,
                previewer = false,
            }))
        end
        wk.add({ "<leader><space>", tbi.buffers, desc = "[ ] Find existing buffers" })
        wk.add({ "<leader>/", find, desc = "[/] Find in current buffer" })
        wk.add({ "<leader>?", tbi.oldfiles, desc = "[?] Find recently opened files" })

        local on_attach = function(_, bufnr)
            wk.add({ "<leader>rn", ":IncRename ", desc = "[R]e[n]ame" })
            wk.add({ "<leader>ca", vim.lsp.buf.code_action, desc = "[C]ode [A]ction" })
            wk.add({ "gd", tbi.lsp_definitions, desc = "[G]oto [D]efinition" })
            wk.add({ "gr", tbi.lsp_references, desc = "[G]oto [R]eferences" })
            wk.add({ "gI", tbi.lsp_implementations, desc = "[G]oto [I]mplementation" })
            wk.add({ "<leader>ds", tbi.lsp_document_symbols, desc = "[D]ocument [S]ymbols" })
            wk.add({
                "<leader>WS",
                tbi.lsp_dynamic_workspace_symbols,
                desc =
                "[W]orkspace [S]ymbols"
            })
        end

        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        --
        -- require("mason-lspconfig").setup_handlers({
        --     function(server_name)
        --         require("lspconfig")[server_name].setup(
        --             {
        --                 capabilities = capabilities,
        --                 on_attach    = on_attach,
        --             })
        --     end,
        -- })

        wk.add({"<leader>fq", ":Telescope quickfix<CR>", desc = "[F]loating [Q]uickfix"})
        wk.add({"<leader>fl", ":Telescope loclist<CR>", desc = "[F]loating [L]oclist"})

        -- todo-comments
        wk.add({ "<leader>dl", ":TodoQuickFix<CR>", desc = "[D]ocument TODO [L]ist" })
        wk.add({ "<leader>dt", ":TodoTelescope<CR>", desc = "[D]ocument TODO [T]elescope" })

        -- true-zen
        -- wk.add({ "<leader>tz", function() vim.cmd.TZAtaraxis() end, desc = "[T]oggle [Z]en" })

        -- twilight
        -- wk.add({ "<leader>tt", ":Twilight<CR>", desc = "[T]oggle [T]wilight" })

        -- undotree
        wk.add({
            "<leader>tu",
            function()
                vim.cmd.UndotreeToggle()
                vim.cmd.UndotreeFocus()
            end,
            desc = "[T]oggle [U]ndotree"
        })
    end,
}
