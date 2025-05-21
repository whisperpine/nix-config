-- originates from:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/wgsl_analyzer.lua

---@type vim.lsp.Config
local M = {}

M = {
  cmd = { "wgsl-analyzer" },
  filetypes = { "wgsl" },
  root_markers = { ".git" },
}

M.settings = {
  -- https://github.com/wgsl-analyzer/wgsl-analyzer/blob/main/editors/code/README.md
  ["wgsl-analyzer"] = {
    success = true,
    customImports = { _dummy_ = "dummy" },
    shaderDefs = {},
    inlayHints = {
      enabled = true,
      typeHints = true,
      parameterHints = true,
      structLayoutHints = true,
      typeVerbosity = "compact", -- "full", "compact", "inner"
    },
    diagnostics = {
      typeErrors = true,
      nagaParsing = true,
      nagaValidation = true,
      nagaVersion = "main",
    },
  },
}

return M
