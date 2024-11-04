local options = {
  formatters_by_ft = {
    markdown = { "markdownlint" },
    javascript = { "deno fmt" },
    typescript = { "deno fmt" },
    json = { "deno fmt" },
    css = { "deno fmt" },
    python = { "ruff format" },
    html = { "superhtml" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    bash = { "shfmt" },
    nix = { "nixfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
