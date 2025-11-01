local plugin = {}

plugin = {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

plugin.opts = {
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

plugin.keys = {
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
  -- The native keymap for "K" in normal mode is `vim.lsp.buf.hover`.
  -- But some language servers will show unexpected backslash before certain
  -- punctuation (e.g. vscode-langservers-extracted, basedpyright).
  -- By leveraging lspsaga, we can work around this issues.
  {
    "K",
    "<cmd>Lspsaga hover_doc <cr>",
    desc = "lspsaga hover doc",
  },
}

return plugin
