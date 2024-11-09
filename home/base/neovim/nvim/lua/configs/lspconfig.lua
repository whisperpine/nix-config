dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- modified from:
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L5C15-L5C23
local on_attach = function(_, bufnr)
  local map = vim.keymap.set
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts "code action")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "show signature help")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>fs", "<cmd> Telescope lsp_document_symbols <cr>", { desc = "telescope document symbols" })
  map("n", "<leader>fd", "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>", { desc = "telescope workspace symbols" })
  map("n", "<leader>dd", "<cmd> Telescope diagnostics bufnr=0 <cr>", { desc = "telescope buffer diagnostics" })
  map("n", "<leader>dw", "<cmd> Telescope diagnostics <cr>", { desc = "telescope workspace diagnostics" })
end

-- require "nvchad.configs.lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- require "lspconfig"
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
  "texlab",
  "taplo",
  "ts_ls",
  "html",
  "sqls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server: clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- with "proto" excluded
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

-- configuring single server: lua_ls
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
