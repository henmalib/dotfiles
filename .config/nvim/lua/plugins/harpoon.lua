return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    vim.keymap.set("n", "<C-a>", function()
      harpoon:list():add()
    end, { desc = "Add harppon mark" })

    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-p>", function()
      harpoon:list():prev()
    end, { desc = "Harppon next mark" })

    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():next()
    end, { desc = "Harppon next mark" })
  end
}
