-- originates from:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/vale_ls.lua

---@type vim.lsp.Config
return {
  cmd = { "vale-ls" },
  filetypes = { "markdown", "text", "tex", "rst" },
  root_markers = { ".vale.ini" },
}
