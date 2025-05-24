dofile(vim.g.base46_cache .. "lsp")
-- https://github.com/NvChad/ui/blob/27f449be42b360cbb9f133aa8853017d277f0c49/lua/nvchad/lsp/init.lua
require("nvchad.lsp").diagnostic_config()

local M = {}

-- modified from:
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

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
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

-- default config for all language servers
vim.lsp.config("*", {
  on_init = M.on_init,
  capabilities = M.capabilities,
})

-- config clangd
vim.lsp.config("clangd", {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

-- enable language servers defined under ~/.config/nvim/lsp
vim.lsp.enable {
  -- ### written by myself ###
  "rust_analyzer",
  "wgsl_analyzer",
  -- "harper_ls",
  "lua_ls",
  "ts_ls",

  -- ### written by lspconfig ###
  "basedpyright",
  "terraformls",
  "marksman",
  "dockerls",
  "tinymist",
  "helm_ls",
  "lemminx",
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
  "taplo",
  "html",
  "zls",
}

-- only enable vale_ls when `.vale.ini` exists
if vim.uv.fs_stat(vim.fs.joinpath(vim.fn.getcwd(), ".vale.ini")) then
  vim.lsp.enable "vale_ls"
end

return M
