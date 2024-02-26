return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"HiPhish/nvim-ts-rainbow2",
	},
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = {
				"lua",
				"vimdoc",
				"typescript",
				"javascript",
			},
			auto_install = true,

			highlight = { enable = true },
			autotag = { enable = true },
			indent = { enable = true },
			rainbow = { enable = true },
		})
	end,
}
