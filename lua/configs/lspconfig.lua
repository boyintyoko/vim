require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local servers = {
  "sorbet",
  "clangd",
  "cssls",
  "emmet_ls",
  "eslint",
  "gopls",
  "html",
  "intelephense",
  "jsonls",
  "pylsp",
  "rust_analyzer",
  "tailwindcss",
  "ts_ls",
  "vuels",
  "yamlls",
}

for _, server in ipairs(servers) do
  if lspconfig[server] then
    lspconfig[server].setup({})
  else
    print("LSP server not found:", server)
  end
end

lspconfig.dartls.setup {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_dir = function(fname)
    local root = lspconfig.util.root_pattern("pubspec.yaml")(fname)
    if root then
      return root
    end
    return vim.fn.fnamemodify(fname, ":p:h")
  end,
}

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    dart = { "dart_format" },
  },
  formatters = {
    dart_format = {
      command = "dart",
      args = { "format" },
      stdin = false,
    },
  },
})

