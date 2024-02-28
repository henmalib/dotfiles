return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>ma",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "harpoon mark Add",
		},

		{
			"<leader>mt",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "harpoon menu Toggle",
		},
		{
			"mn",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "harpoon Next mark",
		},
		{
			"mp",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "harpoon Prev mark",
		},
	},
}
