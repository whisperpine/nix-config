return {
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
  formatters_by_ft = {
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },

    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = {
      "trim_newlines",
      -- "final_new_line", -- This formatter is defined below.
    },

    markdown = { "markdownlint" },
    terraform = { "tofu_fmt" },
    ["terraform-vars"] = { "tofu_fmt" },
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
    graphql = { "biome" },

    -- deno_fmt
    jsx = { "deno_fmt" },
    tsx = { "deno_fmt" },
    javascript = { "deno_fmt" },
    typescript = { "deno_fmt" },
    jsonc = { "deno_fmt" },
    json = { "deno_fmt" },
    css = { "deno_fmt" },
    scss = { "deno_fmt" },
    less = { "deno_fmt" },
    yaml = { "deno_fmt" },
    html = { "deno_fmt" },
  },

  formatters = {
    nixfmt = {
      prepend_args = { "-s" },
    },

    ["clang-format"] = {
      prepend_args = { "--style", "{BasedOnStyle: llvm, IndentWidth: 4}" },
    },

    final_new_line = {
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
  },
}
