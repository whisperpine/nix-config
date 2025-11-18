if vim.fn.filereadable(vim.g.base46_cache .. "lsp") == 1 then
  dofile(vim.g.base46_cache .. "lsp")
end
-- https://github.com/NvChad/ui/blob/27f449be42b360cbb9f133aa8853017d277f0c49/lua/nvchad/lsp/init.lua
require("nvchad.lsp").diagnostic_config()

local M = {}

-- Modified from:
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L5C15-L5C23
M.on_attach = function(_, bufnr)
  local map = vim.keymap.set
  ---@param desc string
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  map("n", "grn", vim.lsp.buf.rename, opts "rename")
  map("n", "gra", vim.lsp.buf.code_action, opts "code action")
  map("n", "<leader>cc", function()
    vim.lsp.buf.signature_help { border = "single" }
  end, opts "show signature help")
  map("i", "<C-s>", function()
    vim.lsp.buf.signature_help { border = "single" }
  end, opts "show signature help")
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
  map("n", "[d", function()
    vim.diagnostic.jump {
      count = -1,
      float = true,
    }
  end, { desc = "lspsaga diagnostic prev" })
  map("n", "]d", function()
    vim.diagnostic.jump {
      count = 1,
      float = true,
    }
  end, { desc = "lspsaga diagnostic next" })
  map("n", "[e", function()
    vim.diagnostic.jump {
      count = -1,
      float = true,
      severity = vim.diagnostic.severity.ERROR,
    }
  end, { desc = "diagnostic prev error" })
  map("n", "]e", function()
    vim.diagnostic.jump {
      count = 1,
      float = true,
      severity = vim.diagnostic.severity.ERROR,
    }
  end, { desc = "diagnostic next error" })
end

-- Disable semanticTokens.
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.workspace.didChangeConfiguration.dynamicRegistration = true
M.capabilities.textDocument.completion.completionItem = {
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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    M.on_attach(_, args.buf)
  end,
})

-- Default config for all language servers.
vim.lsp.config("*", {
  on_init = M.on_init,
  capabilities = M.capabilities,
})

-- Config yamlls.
vim.lsp.config("yamlls", {
  filetypes = {
    "yaml",
    "yaml.docker-compose",
    "yaml.gitlab",
    "yaml.helm-values",
    -- "yaml.ansible",
    "yaml.cloudformation",
  },
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
      -- -- The following customTags are used by AWS Cloudformation.
      -- customTags = { "!Ref", "!Sub", "!GetAtt", "!ImportValue", "!FindInMap sequence" },
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
    },
  },
})

-- Config jsonls.
vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- Config bashls.
vim.lsp.config("bashls", {
  filetypes = { "bash", "zsh", "sh" },
})

-- Config lemminx.
vim.lsp.config("lemminx", {
  settings = {
    xml = {
      validation = {
        -- suppresses the NoGrammarConstraints warning
        noGrammar = "ignore",
      },
    },
  },
})

-- Config ansiblels.
vim.lsp.config("ansiblels", {
  settings = {
    ansible = {
      validation = {
        enabled = false,
        lint = { enabled = false },
      },
    },
  },
})

-- Config ty.
vim.lsp.config("ty", {
  settings = {
    ty = {
      diagnosticMode = "workspace",
      experimental = {
        rename = true,
        autoImport = true,
      },
      inlayHints = {
        enable = true,
        showFunctionReturnTypes = true,
      },
    },
  },
})

-- Enable language servers defined under "~/.config/nvim/lsp".
vim.lsp.enable {
  -- ### written by myself ###
  "rust_analyzer",
  "wgsl_analyzer",
  -- "harper_ls",
  -- "kdl_ls",
  "lua_ls",
  "ts_ls",

  -- ### written by lspconfig ###
  "basedpyright",
  -- "ty", -- experimental
  "terraformls",
  "tailwindcss",
  "ansiblels",
  "csharp_ls",
  "marksman",
  "dockerls",
  "tinymist",
  "helm_ls",
  "lemminx",
  "graphql",
  "nushell",
  "jsonls",
  "cssls",
  "yamlls",
  "nil_ls",
  "bashls",
  "texlab",
  "svelte",
  "buf_ls",
  "clangd",
  "gopls",
  "taplo",
  "biome",
  "html",
  "zls",
}

-- Only enable vale_ls when `.vale.ini` exists.
if vim.uv.fs_stat(vim.fs.joinpath(vim.fn.getcwd(), ".vale.ini")) then
  vim.lsp.enable "vale_ls"
end

return M
