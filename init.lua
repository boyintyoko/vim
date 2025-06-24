vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.mouse = ""

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
    enable = true, -- フォーカスされたファイルを更新
    update_cwd = true,
  },

  filesystem_watchers = {
    enable = true, -- ファイルシステム監視有効
    debounce_delay = 50, -- 監視の遅延時間（ms）
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      },
      padding = "  ", -- ← 左側に2文字分のスペース
    },
  },
}

-- 例: nvim-treeのカラーを変更する設定
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#80a0ff" }) -- フォルダ名（青系）
vim.api.nvim_set_hl(0, "NvimTreeFileName", { fg = "#c0caf5" }) -- ファイル名（淡い青）
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#9ece6a" }) -- 実行可能ファイル（緑系）
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#e0af68" }) -- Git変更あり（オレンジ）
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#0db9d7" }) -- Git新規追加（水色）
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#f7768e" }) -- Git削除（赤）
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#3b4261" }) -- インデントマーカー（グレー）
vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#bb9af7", bold = true }) -- 特殊ファイル（紫、太字）
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#ff9e64", bold = true }) -- オレンジ太字に
vim.api.nvim_set_hl(0, "NvimTreeTitle", { fg = "#7aa2f7", italic = true }) -- 青系イタリック

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
  pink = "#eb6f92",
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
      cmdline = { icon = false },
      search_down = { icon = false },
      search_up = { icon = false },
    },
  },
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_history = "split",
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
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  lsp = {
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
  bg = "#3a2a42", -- 少し濃いめの紫系背景（Rosepineのダークな色調）
  fg = nil, -- 文字色は変えない（透明感）
  reverse = false, -- 反転なし（今回は色で表現）
  bold = false,
  italic = false,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require("conform").format { async = false }
  end,
})

-- 起動時に自動で開かないようにフックで止める（念のため）
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local api = require "nvim-tree.api"
    api.tree.close()
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == "" then
      -- 何も開いていない＝Neovimだけ起動した状態はalpha表示
      require("alpha").start()
      return
    end
    local stat = vim.loop.fs_stat(bufname)
    if stat and stat.type == "directory" then
      require("alpha").start()
    end
  end,
})

require("nvterm").setup {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = "editor",
        row = 0.3,
        col = 0.25,
        width = 0.5,
        height = 0.4,
        border = "single", -- フロート用
      },
      horizontal = {
        location = "rightbelow",
        split_ratio = 0.11, -- ★ VSCode風の低めターミナルに調整
      },
      vertical = {
        location = "rightbelow",
        split_ratio = 0.5,
      },
    },
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}

local lualineColors = {
  normal = "#eb6f92",
  insert = "#9ccfd8",
  visual = "#31748f",
  replace = "#eb6f92",
  command = "#31748f",
}

local function mode_color()
  local mode = vim.fn.mode()
  local color = lualineColors.normal

  if mode:find "^i" then
    color = lualineColors.insert
  elseif mode:find "^v" or mode:find "^V" or mode == "\22" then
    color = lualineColors.visual
  elseif mode:find "^R" then
    color = lualineColors.replace
  elseif mode:find "^c" then
    color = lualineColors.command
  end

  return { fg = "#191724", bg = color, gui = "bold" }
end

require("lualine").setup {
  options = {
    theme = "auto",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        color = mode_color,
        separator = { left = "█", right = "" },
      },
    },
    lualine_b = { "branch", "diff" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}

vim.api.nvim_create_user_command("HtmlTemp", function()
  local template = [[
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>
<body>

</body>
</html>
  ]]

  vim.api.nvim_put(vim.split(template, "\n"), "l", true, true)
end, {})

vim.api.nvim_create_augroup("HighlightZenkaku", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter", "InsertLeave" }, {
  group = "HighlightZenkaku",
  pattern = "*",
  callback = function()
    vim.fn.matchadd("ZenkakuHighlight", "[　-〿]")
  end,
})

vim.api.nvim_set_hl(0, "ZenkakuHighlight", { fg = "#eb6f92", bold = true })

require("scrollbar.handlers.search").setup()

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.dart",
  callback = function()
    vim.lsp.buf.format()
  end,
})
