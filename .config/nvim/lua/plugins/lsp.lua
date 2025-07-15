local function lsp_callback(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  if not client then return end

  ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({
          bufnr = args.buf,
          id = client.id
        })
      end
    })
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  -- config = function()
  --   vim.api.nvim_create_autocmd('LspAttach', {
  --     callback = lsp_callback
  --   })
  -- end
}
