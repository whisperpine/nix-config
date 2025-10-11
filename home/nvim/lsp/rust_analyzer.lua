---@type vim.lsp.Config
local M = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
}

M.settings = {
  -- https://rust-analyzer.github.io/book
  ["rust-analyzer"] = {
    check = { command = "clippy" },
    hover = { links = { enable = false } },
    completion = { callable = { snippets = "none" } },
    cargo = {
      -- This prevents rust-analyzer's cargo check and initial build-script and proc-macro building
      -- from locking the Cargo.lock at the expense of duplicating build artifacts.
      targetDir = true,
    },
  },
}

return M
