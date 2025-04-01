-- originates from:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/lua_ls.lua

---@type vim.lsp.Config
local M = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = vim.lsp.protocol.MessageType.Warning,
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
}

M.settings = {
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
}

return M

-- lspconfig.lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   on_init = on_init,
--   settings = {

--   },
-- }
