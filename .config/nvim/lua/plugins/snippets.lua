return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	lazy = true,
	keys = {
		{
			"<C-k>",
			function()
				require("luasnip").expand()
			end,
			desc = "LuaSnip Expand",
			silent = true,
		},

		{
			"<C-l>",
			function()
				require("luasnip").jump(1)
			end,
			desc = "LuaSnip jump next",
			silent = true,
		},

		{
			"<C-h>",
			function()
				require("luasnip").jump(-1)
			end,
			desc = "LuaSnip jump prev",
			silent = true,
		},
	},
}
