local servers = { "html", "tsserver", "lua_ls", "gopls" }

local function extend_table(defaults)
	return function(add)
		return vim.tbl_deep_extend("force", defaults, add)
	end
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
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = true,
		})

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local opts = { silent = true, noremap = true }

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", ":Telescope lsp_references<cr>", opts)

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Go to LSP definition"
			vim.keymap.set("n", "gd", ":Telescope lsp_definition<cr>", opts)

			opts.desc = "Go to LSP implementation"
			vim.keymap.set("n", "gi", ":Telescope lsp_implementation", opts)

			opts.desc = "Open diagnostics float window"
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

			opts.desc = "Show code action"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show documentation under the cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		end

		local defaults = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup(defaults)
		end

		local e = extend_table(defaults)

		lspconfig["lua_ls"].setup(e({
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
