vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  auto_reload_on_write = true,
  hijack_cursor       = false,
  update_cwd          = true,
  diagnostics = {
    enable = true,
  },
  filters = {
    dotfiles = false,      -- ← ここをfalseにするのがポイント
    custom = {},
  },
  view = {
    width = 30,
    side = 'left',
  },
  git = {
    enable = true,
    ignore = false,   -- gitignoreの無視設定を無効にしてすべて表示
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
  callback = function()
    vim.cmd("DartFmt")
  end,
})

