dofile(vim.g.base46_cache .. "lsp")
-- https://github.com/NvChad/ui/blob/27f449be42b360cbb9f133aa8853017d277f0c49/lua/nvchad/lsp/init.lua
require("nvchad.lsp").diagnostic_config()

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

-- configuring single server: lua_ls
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
        arrayIndex = "Disable",
      },
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

-- configuring single server: ts_ls
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayVariableTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

-- -- configuring single server: tailwindcss
-- lspconfig.tailwindcss.setup {
--   on_attach = on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   filetypes = {
--     "vue",
--     "mdx",
--     "css",
--     "less",
--     "postcss",
--     "sass",
--     "scss",
--     "html",
--     "sugarss",
--     "javascript",
--     "typescript",
--     "svelte",
--   },
-- }

-- configuring single server: rust_analyzer
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy" },
      completion = { callable = { snippets = "none" } },
      inlayHints = { bindingModeHints = { enable = true } },
      procMacro = {
        ignored = {
          leptos_macro = {
            -- "component",
            "server",
          },
        },
      },
    },
  },
}
