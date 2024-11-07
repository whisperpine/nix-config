-- stevearc/conform.nvim --
require("conform").formatters.nixfmt = {
  prepend_args = { "-s" },
}
