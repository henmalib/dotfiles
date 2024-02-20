return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local trouble = require("trouble")

		trouble.setup({})

		vim.keymap.set("n", "<leader>xx", trouble.toggle, {
			silent = true,
			noremap = true,
			desc = "Toggle Trouble menu",
		})
	end,
}
