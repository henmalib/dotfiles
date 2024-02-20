local servers = { "html", "tsserver", "lua_ls" }

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = true,
		})

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local opts = { silent = true, noremap = true }

		local on_attach = function(client, bufnr) end

		local defaults = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup(defaults)
		end

		lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", defaults, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		}))
	end,
}
