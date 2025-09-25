return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional
  },
  config = function()
    require("flutter-tools").setup {
      widget_guides = { enabled = true },
      dev_log = { enabled = true, open_cmd = "tabedit" },
      lsp = {
        color = { enabled = true },
      },
    }
  end,
}

