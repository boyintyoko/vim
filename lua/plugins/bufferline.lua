return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          style = "underline",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        separator_style = "none", -- 直角タブに変更
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "  Explorer",
            highlight = "BufferLineOffset",
            text_align = "left",
          },
        },
      },
    })

    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

    vim.cmd([[
  hi BufferLine guibg=#1a1b26 guifg=#a9b1d6
  hi BufferLineFill guibg=#1a1b26
  hi BufferLineTab guibg=#1a1b26 guifg=#a9b1d6
  hi BufferLineTabSelected guibg=#1a1b26 guifg=#ffffff
  hi BufferLineTabClose guibg=#1a1b26 guifg=#ff5555
]])
  end,
}
