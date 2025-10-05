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

    local Terminal = require("toggleterm.terminal").Terminal
    local term1 = Terminal:new({ id = 1 })

    -- <leader>h で terminal 1 にフォーカス or 起動
    vim.keymap.set("n", "<leader>h", function()
      local term = require("toggleterm.terminal").get(1)
      if term and term:is_open() then
        term:focus()
      else
        term1:open()
      end
    end, { desc = "Focus or open terminal 1" })
  end,
}
