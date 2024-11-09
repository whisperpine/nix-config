-- stevearc/conform.nvim
---@diagnostic disable-next-line: different-requires
require("conform").formatters.nixfmt = {
  prepend_args = { "-s" },
}
