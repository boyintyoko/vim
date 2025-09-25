return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      shade_terminals = true,
      shading_factor = 2,
      direction = "horizontal",
      float_opts = {
        border = "curved",
        winblend = 3,
      },
    })

    vim.keymap.set("n", "<leader>h", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
  end,
}
