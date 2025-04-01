---@type vim.lsp.Config
local M = {}

M = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  -- root_dir = vim.fs.root(0, { "Cargo.toml", ".git" }),
  root_markers = { "Cargo.toml", ".git" },
}

M.settings = {
  ["rust-analyzer"] = {
    check = { command = "clippy" },
    completion = { callable = { snippets = "none" } },
    inlayHints = { bindingModeHints = { enable = true } },
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
