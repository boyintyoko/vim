return {
    "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    local noice = require("noice")

    noice.setup({
      cmdline = {
        format = {
          cmdline     = { pattern = "^:", icon = "" },
          search_down = { pattern = "^/", icon = "" },
          search_up   = { pattern = "^%?", icon = "" },
        },
        view = "cmdline_popup",
        opts = {
          position = { row = "50%", col = "50%" }, -- 中央表示
        },
      },

      messages = {
        enabled = true,
        view = "mini",
        -- icons = false は noice 側でサポートされない場合があるので、cmdline側で空文字に
      },

      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    })

    -- notify を noice 用に差し替え
    vim.notify = require("notify")
  end,
}

