---@type vim.lsp.Config
local M = {}

M = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
}

M.settings = {
  -- https://rust-analyzer.github.io/book
  ["rust-analyzer"] = {
    check = { command = "clippy" },
    completion = { callable = { snippets = "none" } },
    cargo = {
      -- This prevents rust-analyzer's cargo check and initial build-script and proc-macro building
      -- from locking the Cargo.lock at the expense of duplicating build artifacts.
      targetDir = true,
    },
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
