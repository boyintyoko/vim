return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = "yarn install --frozen-lockfile",
    config = function()
      vim.g.coc_global_extensions = {
        "coc-json",
        "coc-xml",
        "coc-yaml",
        "coc-toml",
        "coc-pyright",
        "coc-go",
        "coc-clangd",
        "coc-omnisharp",
        "coc-rust-analyzer",
        "coc-tsserver",
        "coc-lua",
        "coc-flutter",
        "coc-html",
        "coc-css",
        "coc-emmet"
      }
    end,
  },
}
