-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/lua/lsp-zero/cmp-mapping.lua
local function tab_complete(select_opts)
	local cmp = require("cmp")
	return cmp.mapping(function(fallback)
		local col = vim.fn.col(".") - 1

		if cmp.visible() then
			cmp.select_next_item(select_opts)
		elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
			fallback()
		else
			cmp.complete()
		end
	end, { "i", "s" })
end

local function select_prev_or_fallback(select_opts)
	local cmp = require("cmp")
	return cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item(select_opts)
		else
			fallback()
		end
	end, { "i", "s" })
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-emoji",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"Exafunction/codeium.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			experimental = { ghost_text = true },
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true,
					symbol_map = { Codeium = "" },
				}),
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "emoji" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "codeium" },
			}),

			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = tab_complete(),
				["<S-Tab>"] = select_prev_or_fallback(),
				["<C-Space>"] = cmp.mapping.complete(),
				-- ["<C-ie>"] = cmp.mapping.abort(),

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							cmp.confirm()
						end
					else
						fallback()
					end
				end, { "i", "s", "c" }),
			}),
		})
	end,
}
