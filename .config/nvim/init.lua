require("config.opts")
require("config.keybinds")
require("config.lazy")

vim.lsp.enable({
  "ts_ls",
  "lua_ls",
  "jsonls",
  "tailwindcss",
  "eslint",
  "emmet_ls",
  "cssls",
  "gopls",
  "rust_analyzer"
})
