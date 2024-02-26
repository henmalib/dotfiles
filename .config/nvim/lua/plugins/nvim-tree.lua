return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = true,
	keys = {
		{
			"<leader>tg",
			":NvimTreeToggle<cr>",
			"n",
			desc = "Toggle NvimTree",
			noremap = true,
			silent = true,
		},
	},
}
