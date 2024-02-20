return {
	"andweeb/presence.nvim",
	config = function()
		local presence = require("presence")

		presence.setup({
			main_image = "file",
			enable_line_number = true,
		})
	end,
}
