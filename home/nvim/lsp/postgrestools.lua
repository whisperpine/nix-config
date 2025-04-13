-- originates from:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/postgres_lsp.lua

---@type vim.lsp.Config
return {
  cmd = { "postgrestools", "lsp-proxy" },
  filetypes = { "sql" },
  root_markers = { "postgrestools.jsonc" },
}
