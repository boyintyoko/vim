return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript",
        "tsx", "vue", "json", "yaml", "dart",
      },
      highlight = {
        enable = true,
      },
    },
  },

  -- ここから追加 --
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "tsx", "vue" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "HiPhish/nvim-ts-rainbow2",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-rainbow2").setup()
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("rainbow-delimiters.setup").setup {
        strategy = {
          [""] = require("rainbow-delimiters.strategy.global"),
          vim = require("rainbow-delimiters.strategy.local"),
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  -- ここまで追加 --

  { import = "nvchad.blink.lazyspec" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup({
  handle = {
    text = "▎",        -- スクロールバーのつまみの形状
    color = "#eb6f92", -- ピンク系のアクセントカラー（Rosepineのキーワード色）
    hide_if_all_visible = true, -- 全画面表示なら非表示にする
  },
  marks = {
    Search = { color = "#f6c177" },   -- 検索結果のマーク（黄系）
    Error = { color = "#eb6f92" },    -- エラーのマーク（ピンク系）
    Warn = { color = "#f6c177" },     -- 警告のマーク（黄系）
    Info = { color = "#9ccfd8" },     -- 情報のマーク（シアン系）
    Hint = { color = "#6e6a86" },     -- ヒントのマーク（薄紫系）
  },
  handlers = {
    cursor = true,  -- カーソル位置の表示
    search = true,  -- 検索結果の表示
    error = true,
    warn = true,
    info = true,
    hint = true,
  },
})

    end,
  },

  {
    "NvChad/nvterm",
    config = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
{
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = function()
    -- 先にハイライトグループ定義
    vim.api.nvim_set_hl(0, "IndentRainbow1", { fg = "#eb6f92" }) -- ピンク
    vim.api.nvim_set_hl(0, "IndentRainbow2", { fg = "#f6c177" }) -- 黄
    vim.api.nvim_set_hl(0, "IndentRainbow3", { fg = "#9ccfd8" }) -- シアン
    vim.api.nvim_set_hl(0, "IndentRainbow4", { fg = "#ebbcba" }) -- オレンジ
    vim.api.nvim_set_hl(0, "IndentRainbow5", { fg = "#31748f" }) -- 青緑
    vim.api.nvim_set_hl(0, "IndentRainbow6", { fg = "#6e6a86" }) -- 紫

    local ibl = require("ibl")
    ibl.setup {
      indent = {
        highlight = {
          "IndentRainbow1",
          "IndentRainbow2",
          "IndentRainbow3",
          "IndentRainbow4",
          "IndentRainbow5",
          "IndentRainbow6",
        },
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
      },
    }
  end,
}


}

