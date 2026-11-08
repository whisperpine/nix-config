local M = {}

M = {
  "stevearc/conform.nvim",
  event = "BufReadPost",
  opts = {},
}

M.opts.format_on_save = {
  -- These options will be passed to conform.format()
  timeout_ms = 500,
  lsp_fallback = true,
}

-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
M.opts.formatters_by_ft = {
  -- Use the "_" filetype to run formatters on filetypes that don't
  -- have other formatters configured.
  ["_"] = {},

  -- Use the "*" filetype to run formatters on all filetypes.
  ["*"] = {
    "trim_newlines",
    "trim_whitespace",
    -- -- This formatter is defined below.
    -- "final_new_line",
  },

  hcl = { "tofu_fmt" },
  terraform = { "tofu_fmt" },
  ["terraform-test"] = { "tofu_fmt" },
  ["terraform-vars"] = { "tofu_fmt" },
  markdown = { "rumdl" },
  python = { "ruff_format", "ruff_organize_imports" },
  xml = { "xmlstarlet" },
  rust = { "rustfmt" },
  lua = { "stylua" },
  nix = { "nixfmt" },
  sql = { "sqruff" },
  bib = { "bibtex-tidy" },
  typst = { "typstyle" },
  hurl = { "hurlfmt" },
  toml = { "taplo" },
  zig = { "zigfmt" },
  qml = { "qmlformat" },
  bash = { "shfmt" },
  zsh = { "shfmt" },
  sh = { "shfmt" },
  go = { "gofmt" },

  -- clang-format
  cs = { "clang-format" },
  java = { "clang-format" },
  objc = { "clang-format" },
  cpp = { "clang-format" },
  c = { "clang-format" },

  -- biome, bun_fmt, rustywind
  javascriptreact = { "biome-check", "rustywind" },
  typescriptreact = { "biome-check", "rustywind" },
  javascript = { "biome-check", "rustywind" },
  typescript = { "biome-check", "rustywind" },
  graphql = { "bun_fmt" },
  html = { "bun_fmt" },
  jsonc = { "bun_fmt" },
  json = { "bun_fmt" },
  yaml = { "bun_fmt" },
  css = { "bun_fmt" },
}

M.opts.formatters = {
  ["nixfmt"] = {
    prepend_args = { "-s" },
  },
  ["clang-format"] = {
    prepend_args = { "--style", "{BasedOnStyle: llvm, IndentWidth: 4}" },
  },
}

-- A custom formatter "final_new_line".
M.opts.formatters.final_new_line = {
  meta = { description = "Insert a new line at the end of the file." },
  format = function(_, _, lines, callback)
    local out_lines = vim.deepcopy(lines)
    while #out_lines > 0 and out_lines[#out_lines] == "" do
      table.remove(out_lines)
    end
    table.insert(out_lines, "")
    callback(nil, out_lines)
  end,
}

-- A custom formatter "bun_fmt".
M.opts.formatters.bun_fmt = {
  meta = { description = "Format with Bun's built-in formatter (bun fmt)." },
  command = "bun",
  stdin = true,
  -- `--no-script` prevents a package.json "fmt" script from hijacking stdin.
  -- `--stdin-filepath` lets Bun infer the parser from the buffer's path.
  args = function(_, ctx)
    local args = { "fmt", "--no-script", "--stdin-filepath", ctx.filename }
    local ft = vim.bo[ctx.buf].filetype
    local ext = ctx.filename:match "%.([^.]+)$"
    -- Compound filetypes (e.g. "yaml.ansible", "yaml.cloudformation")
    -- may not have a .yaml/.yml extension, so force the parser when needed.
    if ft:match "^yaml%." and ext ~= "yaml" and ext ~= "yml" then
      vim.list_extend(args, { "--parser", "yaml" })
    end
    -- JSONC allows trailing commas and `bun fmt` adds them by default.
    -- Disable trailing commas for jsonc regardless of any project config.
    if ft == "jsonc" then
      vim.list_extend(args, { "--trailing-comma", "none" })
    end
    return args
  end,
  -- Bun resolves bunfig.toml/.prettierrc/.editorconfig from the cwd.
  cwd = function(_, ctx)
    return vim.fs.root(ctx.dirname, {
      "bunfig.toml",
      "package.json",
      ".prettierrc",
      ".prettierrc.json",
      ".prettierrc.json5",
      ".prettierrc.yaml",
      ".prettierrc.yml",
      ".prettierrc.js",
      ".prettierrc.cjs",
      ".prettierrc.mjs",
      "prettier.config.js",
      "prettier.config.cjs",
      "prettier.config.mjs",
    })
  end,
}

return M
