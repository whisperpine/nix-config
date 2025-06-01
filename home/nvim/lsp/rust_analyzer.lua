---@type vim.lsp.Config
local M = {}

M = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
}

M.settings = {
  ["rust-analyzer"] = {
    check = { command = "clippy" },
    completion = { callable = { snippets = "none" } },
    -- inlayHints = { bindingModeHints = { enable = true } },
    procMacro = {
      ignored = {
        leptos_macro = {
          -- "component",
          "server",
        },
      },
    },
  },
}

return M
