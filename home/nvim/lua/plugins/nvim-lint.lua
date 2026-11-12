local M = {}

M = {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
}

M.config = function()
  require("lint").linters_by_ft = {
    html = { "htmlhint" },
    terraform = { "tflint" },
    json = { "redocly" },
    yaml = { "redocly" },
    go = { "golangcilint" },
    ["yaml.ansible"] = { "ansible_lint" },
    ["yaml.cloudformation"] = { "cfn_lint" },
  }
end

M.init = function()
  local function get_file_name()
    return vim.api.nvim_buf_get_name(0)
  end

  -- Custom linter named "jactionlint".
  require("lint").linters.jactionlint = {
    cmd = "jactionlint",
    stdin = true,
    args = {
      "--format",
      "{{json .}}",
      "--stdin-filename",
      get_file_name,
      "-",
    },
    ignore_exitcode = true,
    parser = function(output)
      if output == "" then
        return {}
      end
      local decoded = vim.json.decode(output)
      if decoded == nil then
        return {}
      end
      local diagnostics = {}
      for _, item in ipairs(decoded) do
        table.insert(diagnostics, {
          lnum = item.line - 1,
          end_lnum = item.line - 1,
          col = item.column - 1,
          end_col = item.end_column,
          severity = vim.diagnostic.severity.WARN,
          source = "jactionlint: " .. item.kind,
          message = item.message,
        })
      end
      return diagnostics
    end,
  }

  local lint_events = {
    "BufWritePost",
    "BufReadPost",
    "InsertLeave",
  }
  vim.api.nvim_create_autocmd(lint_events, {
    callback = function()
      -- Try_lint without arguments runs the linters defined
      -- in `linters_by_ft` for the current filetype.
      require("lint").try_lint()
      -- You can call `try_lint` with a linter name or a list of names to always
      -- run specific linters, independent of the `linters_by_ft` configuration.
      require("lint").try_lint "typos"

      -- Pattern match filepath to lint github actions.
      local filepath = vim.fn.expand "%:p"
      if filepath:match "^.*/.github/workflows/.*%.y(a?)ml$" then
        require("lint").try_lint "jactionlint"
      end
    end,
  })
end

return M
