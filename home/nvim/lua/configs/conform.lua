local M = {}

M.format_on_save = {
  -- These options will be passed to conform.format()
  timeout_ms = 500,
  lsp_fallback = true,
}

-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
M.formatters_by_ft = {
  -- Use the "_" filetype to run formatters on filetypes that don't
  -- have other formatters configured.
  ["_"] = { "trim_whitespace" },

  -- Use the "*" filetype to run formatters on all filetypes.
  ["*"] = {
    "trim_newlines",
    -- This formatter is defined below.
    -- "final_new_line",
  },

  markdown = { "markdownlint" },
  terraform = { "tofu_fmt" },
  ["terraform-vars"] = { "tofu_fmt" },
  python = { "ruff_format" },
  xml = { "xmlstarlet" },
  rust = { "rustfmt" },
  lua = { "stylua" },
  nix = { "nixfmt" },
  proto = { "buf" },
  graphql = { "biome" },
  sql = { "sqruff" },
  typst = { "typstyle" },
  hurl = { "hurlfmt" },
  toml = { "taplo" },
  zig = { "zigfmt" },
  sh = { "shfmt" },

  -- clang-format
  cs = { "clang-format" },
  java = { "clang-format" },
  objc = { "clang-format" },
  cpp = { "clang-format" },
  c = { "clang-format" },

  -- deno_fmt, rustywind
  javascriptreact = { "deno_fmt", "rustywind" },
  typescriptreact = { "deno_fmt", "rustywind" },
  javascript = { "deno_fmt", "rustywind" },
  typescript = { "deno_fmt", "rustywind" },
  html = { "deno_fmt", "rustywind" },
  yaml = { "deno_fmt" },
  jsonc = { "deno_fmt" },
  json = { "deno_fmt" },
  css = { "deno_fmt" },
  scss = { "deno_fmt" },
  less = { "deno_fmt" },
}

M.formatters = {
  ["nixfmt"] = {
    prepend_args = { "-s" },
  },

  ["clang-format"] = {
    prepend_args = { "--style", "{BasedOnStyle: llvm, IndentWidth: 4}" },
  },

  ["final_new_line"] = {
    meta = { description = "Insert a new line at the end of the file." },
    format = function(_, _, lines, callback)
      local out_lines = vim.deepcopy(lines)
      while #out_lines > 0 and out_lines[#out_lines] == "" do
        table.remove(out_lines)
      end
      table.insert(out_lines, "")
      callback(nil, out_lines)
    end,
  },
}

return M
