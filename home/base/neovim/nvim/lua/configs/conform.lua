return {
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
  formatters_by_ft = {
    markdown = { "markdownlint-cli2" },
    terraform = { "tofu_fmt" },
    python = { "ruff_format" },
    objc = { "clang-format" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    xml = { "xmlstarlet" },
    rust = { "rustfmt" },
    lua = { "stylua" },
    bash = { "shfmt" },
    nix = { "nixfmt" },
    proto = { "buf" },
    sql = { "sqlfluff" },

    -- deno_fmt
    javascript = { "deno_fmt" },
    typescript = { "deno_fmt" },
    jsx = { "deno_fmt" },
    tsx = { "deno_fmt" },
    jsonc = { "deno_fmt" },
    json = { "deno_fmt" },
    css = { "deno_fmt" },
    sass = { "deno_fmt" },
    scss = { "deno_fmt" },
    less = { "deno_fmt" },
    yaml = { "deno_fmt" },
    html = { "deno_fmt" },
  },

  formatters = {
    nixfmt = {
      prepend_args = { "-s" },
    },
  },
}
