return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			tailwind = true,
			css = true,
			rgb_fn = true,
			hsl_fn = true,
		})
	end,
}
