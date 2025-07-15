return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local Snacks = require("snacks")

    Snacks.setup({
      -- TODO: see all snacks
      git = { enabled = true },
      bigfile = { enabled = true },
      image = { enabled = true },
      dim = { enabled = true },
      indent = { enabled = true },
      scope = { enabled = true },
      input = { enabled = true },
      layout = { enabled = true },
      notifier = { enabled = true },
      notify = { enabled = true },
      rename = { enabled = true }
    })

    -- Oil
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilActionsPost",
      callback = function(event)
        if event.data.actions.type == "move" then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })

    -- NvimTree
    local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvimTreeSetup",
      callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
            data = data
            Snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })
  end
}
