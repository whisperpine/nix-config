-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "markdown_oxide",
  "rust_analyzer",
  "basedpyright",
  "tailwindcss",
  "terraformls",
  "helm_ls",
  "lemminx",
  "jsonls",
  "cssls",
  "yamlls",
  "nil_ls",
  "bashls",
  "taplo",
  "ts_ls",
  "html",
  "sqls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server: clangd
lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- with "proto" excluded
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}
