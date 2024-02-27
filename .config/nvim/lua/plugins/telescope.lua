return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
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
