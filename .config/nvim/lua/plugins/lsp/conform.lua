return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier", "biome" },
				typescript = { "prettier", "biome" },
				javascriptreact = { "prettier", "biome" },
				typescriptreact = { "prettier", "biome" },
				astro = { "prettier", "biome" },
				svelte = { "prettier", "biome" },
				css = { "prettier", "biome" },
				html = { "prettier", "biome" },
				json = { "prettier", "biome" },
				markdown = { "prettier", "biome" },
				lua = { "stylua" },
				go = { "gofmt" },
				nix = { "nixpkgs_fmt" },
				python = { "black" },
				sql = { "sqlfluff" }
			},
			format_after_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
				async = true,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})
	end,
}
