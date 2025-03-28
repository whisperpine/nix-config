dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- modified from:
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L5C15-L5C23
local on_attach = function(_, bufnr)
  local map = vim.keymap.set
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  -- map("n", "grn", "<cmd> Lspsaga rename <cr>", opts "NvRenamer")
  map("n", "grn", vim.lsp.buf.rename, opts "LSP rename")
  -- map("n", "gra", "<cmd> Lspsaga code_action <cr>", opts "code action")
  map("n", "gra", vim.lsp.buf.code_action, opts "code action")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "show signature help")
  map("i", "<C-l>", vim.lsp.buf.signature_help, opts "show signature help")
  map(
    "n",
    "<leader>fs",
    "<cmd> Telescope lsp_document_symbols <cr>",
    { desc = "telescope document symbols" }
  )
  map(
    "n",
    "<leader>fS",
    "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>",
    { desc = "telescope workspace symbols" }
  )
  map(
    "n",
    "<leader>dd",
    "<cmd> Telescope diagnostics bufnr=0 <cr>",
    { desc = "telescope buffer diagnostics" }
  )
  map(
    "n",
    "<leader>dD",
    "<cmd> Telescope diagnostics <cr>",
    { desc = "telescope workspace diagnostics" }
  )
  -- map("n", "gr", vim.lsp.buf.references, opts "Show references")
  -- map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  -- map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  -- map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
end

-- require "nvchad.configs.lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

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
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
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
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
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

-- configuring single server: harper_ls
lspconfig.harper_ls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    ["harper-ls"] = {
      -- default userDictPath: ~/.config/harper-ls/dictionary.txt
      userDictPath = "",
      -- default fileDictPath: ~/.local/share/harper-ls/file_dictionaries
      fileDictPath = "",
      -- see all linter rules:
      -- https://writewithharper.com/docs/rules
      linters = {
        AnA = false,
        SpellCheck = false,
        ToDoHyphen = false,
        UnclosedQuotes = false,
        SentenceCapitalization = false,
        CapitalizePersonalPronouns = false,
        OxfordComma = false,
      },
      codeActions = {
        ForceStable = true,
      },
      markdown = {
        IgnoreLinkTitle = true,
      },
      diagnosticSeverity = "hint",
      isolateEnglish = true,
    },
  },
}

-- only enable vale_ls when `.vale.ini` exists
if vim.uv.fs_stat(vim.fs.joinpath(vim.fn.getcwd(), ".vale.ini")) then
  lspconfig.vale_ls.setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
