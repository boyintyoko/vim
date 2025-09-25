return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = { enabled = true }, -- 開いたファイルを追従
        hijack_netrw_behavior = "disabled",
        use_libuv_file_watcher = true,
        cwd_target = {
          auto_change = true, -- 開いたディレクトリに自動で追従
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {},
          always_show = {},
        },
        filtered_items_visible = false,
      },
    })


    vim.keymap.set("n", "<leader>n", ":Neotree focus<CR>", { desc = "NeoTree Focus" })
  end,
}
