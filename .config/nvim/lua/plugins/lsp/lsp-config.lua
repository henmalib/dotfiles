local servers = { "lua_ls" }

local function extend_table(defaults)
    return function(add)
        return vim.tbl_deep_extend("force", defaults, add)
    end
end


local opts = { silent = true, noremap = true }

local on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
    end

    opts.buffer = bufnr

    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gR", ":Telescope lsp_references<cr>", opts)

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Go to LSP definition"
    vim.keymap.set("n", "gd", ":Telescope lsp_definitions<cr>", opts)

    opts.desc = "Go to LSP implementation"
    vim.keymap.set("n", "gi", ":Telescope lsp_implementation<cr>", opts)

    opts.desc = "Open diagnostics float window"
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

    opts.desc = "Show code action"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show documentation under the cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local defaults = {
            on_attach = on_attach,
            capabilities = capabilities,
            completions = {
                completeFunctionCalls = true,
            },
        }
        local lspconfig = require("lspconfig")

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = false,
            handlers = {
                function(server)
                    require("lspconfig")[server].setup(defaults)
                end,
            },
        })

        local e = extend_table(defaults)

        lspconfig.tsserver.setup(e {
            settings = {
                javascript = {
                    inlayHints = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },

                typescript = {
                    inlayHints = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },
            },
        })

        lspconfig["lua_ls"].setup(e {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    hint = {
                        enable = true,
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            --[vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
