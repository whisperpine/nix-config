local M = {}

M = {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

M.opts = {
  symbol_in_winbar = {
    hide_keyword = false,
  },
  lightbulb = {
    virtual_text = false,
  },
  ui = {
    border = "single",
    lines = { "└", "├", "│", "─", "┌" },
    code_action = " ",
    expand = "",
    collapse = "",
  },
  outline = {
    win_width = 32,
    auto_preview = true,
    close_after_jump = true,
  },
}

M.keys = {
  {
    "gp",
    "<cmd> Lspsaga peek_definition <cr>",
    desc = "lspsaga peek definition",
  },
  {
    "gP",
    "<cmd> Lspsaga peek_type_definition <cr>",
    desc = "lspsaga peek type definition",
  },
}

return M
