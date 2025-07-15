return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",          desc = "Telescope find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",           desc = "Telescope grep files" },
    { "<leader>fd", "<cmd>Telescope builtin.diagnostics<cr>", desc = "Telescope LSP diagnostics" },
    "<leader>ev", "<leader>mp", "<leader>ev"
  },
  config = function()
    require("telescope").setup({})
    local builtin = require("telescope.builtin")


    vim.keymap.set("n", "<leader>ht", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>mp", builtin.man_pages, { desc = "Telescope Man Pages" })
    vim.keymap.set("n", "<leader>ev", function()
      builtin.find_files({
        cwd = vim.fn.stdpath("config")
      })
    end, { desc = "Telescope Edit Vim" })
  end
}
