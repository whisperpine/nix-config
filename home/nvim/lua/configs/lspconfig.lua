dofile(vim.g.base46_cache .. "lsp")
-- https://github.com/NvChad/ui/blob/27f449be42b360cbb9f133aa8853017d277f0c49/lua/nvchad/lsp/init.lua
require("nvchad.lsp").diagnostic_config()

-- modified from:
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L5C15-L5C23
local on_attach = function(_, bufnr)
  local map = vim.keymap.set
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  map("n", "grn", vim.lsp.buf.rename, opts "rename")
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
end

-- disable semanticTokens
local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- -- require "nvchad.configs.lspconfig"
-- local nvlsp = require "nvchad.configs.lspconfig"

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

-- configuring single server: harper_ls
lspconfig.harper_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
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
    on_init = on_init,
    capabilities = capabilities,
  }
end
