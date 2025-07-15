return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  keys = {
    { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
