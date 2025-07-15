return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      options = {
        transparency = true
      }
    })
    vim.cmd("colorscheme onedark_vivid")
  end
}
