return {
	"andweeb/presence.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		main_image = "file",
		-- log_level = 'debug',
		enable_line_number = true,
		buttons = false,
	},
}
