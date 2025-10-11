-- originates from:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ts_ls.lua

---@type vim.lsp.Config
local M = {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
}

M.settings = {
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
}

return M
