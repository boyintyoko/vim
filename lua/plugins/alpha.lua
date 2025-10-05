return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      local ok, alpha = pcall(require, "alpha")
      if not ok then return end
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "██╗  ██╗ █████╗ ██╗     ██╗",
        "██║  ██║██╔══██╗██║     ██║",
        "███████║███████║██║     ██║",
        "██╔══██║██╔══██║██║     ██║",
        "██║  ██║██║  ██║███████╗██║",
        "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝",
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "📄 New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "🔍 Find file", ":Telescope find_files <CR>"),
        dashboard.button("q", "❌ Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            vim.cmd("Alpha")
          end
        end,
      })
    end,
  },
}
