return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		tailwind = true,
		css = true,
		rgb_fn = true,
		hsl_fn = true,
	},
}
