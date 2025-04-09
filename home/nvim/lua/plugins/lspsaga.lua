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
    "]d",
    "<cmd> Lspsaga diagnostic_jump_next <cr>",
    desc = "lspsaga diagnostic next",
  },
  {
    "[d",
    "<cmd> Lspsaga diagnostic_jump_prev <cr>",
    desc = "lspsaga diagnostic prev",
  },
  {
    "]e",
    function()
      require("lspsaga.diagnostic"):goto_prev {
        severity = vim.diagnostic.severity.ERROR,
      }
    end,
    desc = "lspsaga diagnostic next error",
  },
  {
    "[e",
    function()
      require("lspsaga.diagnostic"):goto_prev {
        severity = vim.diagnostic.severity.ERROR,
      }
    end,
    desc = "lspsaga diagnostic prev error",
  },
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

return plugin
