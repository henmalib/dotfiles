return {
    "nvim-tree/nvim-tree.lua",
    event="VeryLazy",
    dependencies={
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local tree = require('nvim-tree')
        tree.setup()

        vim.keymap.set('n', '<leader>tg', ':NvimTreeToggle<cr>', {desc='Toggle NvimTree', silent=true, noremap=true})
    end
}
