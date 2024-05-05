return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    keys = {
        {
            "<leader>un",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss all Notifications",
        },
    },
    opts = {
        timeout = 3000,
        background_colour = "#0000000f",
    },
    init = function()
        local notify = require('notify')

        vim.notify = function(msg, ...)
            if msg == "No information available" then
                return
            end

            notify(msg, ...)
        end
    end,
}
