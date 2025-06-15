vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.opt.cursorline = true

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require("nvim-tree").setup {
  disable_netrw = true,
  hijack_netrw = true,
  auto_reload_on_write = true,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  view = {
    width = 30,
    side = "left",
  },
  git = {
    enable = true,
    ignore = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.dart",
  callback = function(args)
    if args.buf == vim.api.nvim_get_current_buf() then
      vim.cmd "DartFmt"
    end
  end,
})

vim.api.nvim_set_hl(0, "@function", { fg = "#9ccfd8", italic = true }) -- 関数
vim.api.nvim_set_hl(0, "@variable", { fg = "#f6c177" }) -- 変数
vim.api.nvim_set_hl(0, "@keyword", { fg = "#eb6f92", bold = true }) -- キーワード
vim.api.nvim_set_hl(0, "@string", { fg = "#ebbcba" }) -- 文字列
vim.api.nvim_set_hl(0, "@comment", { fg = "#6e6a86", italic = true }) -- コメント
vim.api.nvim_set_hl(0, "@number", { fg = "#f6c177" }) -- 数値
vim.api.nvim_set_hl(0, "@type", { fg = "#9ccfd8" })

local colors = {
  bg = "#191724",
  fg = "#e0def4",
  yellow = "#f6c177",
  cyan = "#9ccfd8",
  darkblue = "#6e6a86",
  green = "#9ccfd8",
  orange = "#eb6f92",
  violet = "#9ccfd8",
  magenta = "#eb6f92",
  blue = "#31748f",
  red = "#eb6f92",
  pink = "#eb6f92", -- ここ追加（magentaと同じ）
}

local theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.pink, gui = "bold" },
    b = { fg = colors.fg, bg = colors.darkblue },
    c = { fg = colors.fg, bg = colors.bg },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
    b = { fg = colors.fg, bg = colors.darkblue },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
    b = { fg = colors.fg, bg = colors.darkblue },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    b = { fg = colors.fg, bg = colors.darkblue },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
}

require("lualine").setup {
  options = {
    theme = theme,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}

require "rainbow-delimiters.setup"()

-- 好きな色で上書き
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#eb6f92" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#f6c177" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#9ccfd8" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ebbcba" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#31748f" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#6e6a86" })

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#eb6f92",
  bold = true,
})

local noiceColors = {
  bg = "#191724",
  fg = "#e0def4",
  pink = "#eb6f92",
  red = "#eb6f92",
  green = "#9ccfd8",
  yellow = "#f6c177",
  darkblue = "#6e6a86",
  blue = "#31748f",
  orange = "#ebbcba",
}

require("noice").setup {
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {
      position = { row = 5, col = "50%" },
      size = { width = 60, height = "auto" },
      border = {
        style = "rounded",
        text = { top = " Command ", top_align = "center" },
        highlight = { border = noiceColors.pink, background = noiceColors.bg },
      },
      win_options = {
        winhighlight = "Normal:" .. noiceColors.bg,
      },
    },
    format = {
      -- カスタムコマンドのフォーマットがあればここに
    },
  },
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_history = "split",
    -- notifyの見た目もRosepine風に
    view_formats = {
      notify = {
        border = "rounded",
        win_options = {
          winhighlight = "NormalFloat:NoiceNotify,FloatBorder:NoiceNotifyBorder",
        },
      },
    },
  },
  popupmenu = {
    enabled = true,
    backend = "nui",
    -- popupmenuの色も指定できる（必要なら）
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  lsp = {
    -- LSP関連メッセージのカスタムもここで
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    progress = {
      enabled = true,
      format = "{title} {spinner} {percentage}%",
      throttle = 100,
    },
  },
}

-- highlightグループを作る（init.luaかcolorscheme設定ファイルに書く）
vim.cmd [[
  highlight NoiceNotify guibg=#191724 guifg=#e0def4
  highlight NoiceNotifyBorder guifg=#eb6f92 guibg=#191724
  highlight NoiceCmdline guibg=#191724 guifg=#eb6f92
  highlight NoiceCmdlineBorder guifg=#eb6f92 guibg=#191724
]]

vim.api.nvim_set_hl(0, "Visual", {
  bg = "#53395d",
  fg = "#ebbcba",
  italic = true,
})

vim.api.nvim_set_hl(0, "Visual", {
  bg = "#3a2a42",
  fg = nil,
})

vim.api.nvim_set_hl(0, "Visual", {
  bg = "#3a2a42",  -- 少し濃いめの紫系背景（Rosepineのダークな色調）
  fg = nil,        -- 文字色は変えない（透明感）
  reverse = false, -- 反転なし（今回は色で表現）
  bold = false,
  italic = false,
})

