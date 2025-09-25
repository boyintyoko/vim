return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({
      filetypes = { "html", "xml", "javascript", "typescript", "tsx", "vue", "svelte", "php", "markdown" }
    })
  end,
}
