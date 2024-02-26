return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>xx",
			":TroubleToggle<cr>",
			"n",
			desc = "Toggle Trouble Menu",
			noremap = true,
			silent = true,
		},
	},
	config = true,
}
