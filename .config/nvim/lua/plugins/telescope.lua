return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{
			"<leader>ff",
			":Telescope find_files<cr>",
			desc = "Find Files",
			silent = true,
			noremap = true,
		},

		{
			"<leader>fg",
			":Telescope live_grep<cr>",
			desc = "Find Grep",
			silent = true,
			noremap = true,
		},

		{
			"<leader>fb",
			":Telescope buffers<cr>",
			desc = "Find Buffers",
			silent = true,
			noremap = true,
		},
	},
}
