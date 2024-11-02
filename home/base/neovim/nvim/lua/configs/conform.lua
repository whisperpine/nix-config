local options = {
  formatters_by_ft = {
    javascript = { "deno fmt" },
    typescript = { "deno fmt" },
    json = { "deno fmt" },
    css = { "deno fmt" },
    python = { "ruff format" },
    html = { "superhtml" },
    lua = { "stylua" },
    bash = { "shfmt" },
    nix = { "nixfmt", "-s" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
