return {
	"navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
	config = function()
		onedark = require('onedark')
		onedark.setup {
			style = "deep",
			transparent = true
		}

		onedark.load()
	end
}
