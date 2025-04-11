---@type vim.lsp.Config
local M = {}

M = {
  cmd = { "tinymist", "lsp" },
  filetypes = { "typst" },
}

M.settings = {
  -- formatterMode = "typstyle",
  -- semanticTokens = "disable",
  -- exportPdf = "onSave",
}

return M
