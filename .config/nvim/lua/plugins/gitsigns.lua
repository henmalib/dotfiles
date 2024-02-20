return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		local git = require("gitsigns")

		git.setup({})
	end,
}
