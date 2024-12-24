return {
	"vyfor/cord.nvim",
	branch = "client-server",
	build = "cargo build --release",
	event = "VeryLazy",
	opts = {
		lsp = {
			show_problem_count = true
		},
		text = {
			workspace = ''
		}
	}
}
