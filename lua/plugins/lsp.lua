-- ~/.config/nvim/lua/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp", -- autocomplete
        },
        opts = {
            servers = {"pyright", "vtsls", "intelephense", "lua_ls"},
        },
        config = function(_, opts)
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            -- Initialize mason
            mason.setup()
            mason_lspconfig.setup({ensure_installed = opts.servers})

            -- Inject autocomplete capabilities
            local has_blink, blink = pcall(require, "blink.cmp")
            if has_blink then
                vim.lsp.config('*', {
                     capabilities = blink.get_lsp_capabilities()
                })
            end

            -- Native processing with vim.lsp
            for _, server_name in ipairs(opts.servers) do
                vim.lsp.enable(server_name)
                -- vim.notify("Failed to load base configuration for: " .. server_name)
            end

            -- keymaps
            vim.api.nvim_create_autocmd("LspAttach",{
                callback = function(args)
                    local map_opts = {buffer = args.buf}
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, map_opts)
                end,
            })
        end,
    }
}
