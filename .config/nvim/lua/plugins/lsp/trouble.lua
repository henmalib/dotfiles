return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>xx",
            ":Trouble diagnostics toggle<cr>",
            "n",
            desc = "Toggle Trouble Menu",
            noremap = true,
            silent = true,
        },
    },
    config = true,
}
