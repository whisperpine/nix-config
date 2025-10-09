---@type vim.lsp.Config
local M = {}

M = {
  cmd = { "kdl-lsp" },
  filetypes = { "kdl" },
  root_markers = { ".git" },
  settings = { ["kdl"] = {} },
}

return M
