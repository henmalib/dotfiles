--https://github.com/craftzdog/dotfiles-public/commit/7ff72c67ad2d4d2909c3ee0840e5b0edbc86e52a#diff-e04d6555fc16437900710ece14c09f08fba87b230baba1d6c6084868b0df76a3

local M = {}

function M.cowboy()
	---@type table?
	local id
	local ok = true
	for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
		local count = 0
		local timer = assert(vim.loop.new_timer())
		local map = key
		vim.keymap.set("n", key, function()
			if vim.v.count > 0 then
				count = 0
			end
			if count >= 5 then
				ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
					icon = "🤠",
					replace = id,
					keep = function()
						return count >= 10
					end,
				})
				if not ok then
					id = nil
					return map
				end
			else
				count = count + 1
				timer:start(2000, 0, function()
					count = 0
				end)
				return map
			end
		end, { expr = true, silent = true })
	end
end

function M.hardmode()
	local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

	local opts = { silent = true, noremap = true }

	local disabled_keys = {
		"<Up>",
		"<Down>",
		"<Left>",
		"<Right>",
		"<Up>",
	}

	for _, key in ipairs(disabled_keys) do
		vim.keymap.set("n", key, msg, opts)
	end

	for _, key in ipairs(disabled_keys) do
		vim.keymap.set("i", key, "<C-o>" .. msg, opts)
	end
end

return M
