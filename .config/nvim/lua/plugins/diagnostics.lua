return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    preset = "classic",
    multilines = {
      enabled = true
    },
    break_line = {
      enabled = true,
      after = 50
    }
  }
}
