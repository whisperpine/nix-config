local lsputil = require "lsputil"
local on_attach = lsputil.on_attach
local on_init = lsputil.on_init
local capabilities = lsputil.capabilities

-- require "lspconfig"
local lspconfig = require "lspconfig"

local servers = {
  "basedpyright",
  "terraformls",
  "marksman",
  "dockerls",
  "helm_ls",
  "lemminx",
  "jsonls",
  "cssls",
  "yamlls",
  "nil_ls",
  "bashls",
  "texlab",
  "svelte",
  "buf_ls",
  "taplo",
  "html",
  "sqls",
}

-- LSPs with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- configuring single server: clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  -- with "proto" excluded
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}
