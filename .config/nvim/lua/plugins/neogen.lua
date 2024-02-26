return {
	"danymat/neogen",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = {
		snippet_engine = "luasnip",
	},
	keys = {
		{ "<leader>ng", ":Neogen<cr>", desc = "Trigger neogen", silent = true, noremap = true },
	},
}
