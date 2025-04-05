local plugin = {}

plugin = {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
}

plugin.config = function()
  require("lint").linters_by_ft = {
    sql = { "sqruff" },
    markdown = { "markdownlint" },
    javascript = { "biomejs" },
    typescript = { "biomejs" },
    graphql = { "biomejs" },
    json = { "biomejs" },
    css = { "biomejs" },
    jsx = { "biomejs" },
    tsx = { "biomejs" },
  }
end

plugin.init = function()
  local lint_events = {
    "BufWritePost",
    "BufReadPost",
    "InsertLeave",
  }
  vim.api.nvim_create_autocmd(lint_events, {
    callback = function()
      -- try_lint without arguments runs the linters defined
      -- in `linters_by_ft` for the current filetype
      require("lint").try_lint()
    end,
  })
end

return plugin
