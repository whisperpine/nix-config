return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    opts = {
      warn_no_results = false, -- show a warning when there are no results
      open_no_results = true, -- open the trouble window when there are no results
      modes = {
        -- The LSP base mode for:
        -- * lsp_definitions, lsp_references, lsp_implementations
        -- * lsp_type_definitions, lsp_declarations, lsp_command
        lsp_base = {
          params = {
            -- include the current location in the results
            include_current = true,
          },
        },
      },
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>dS",
        "<cmd> Trouble diagnostics toggle focus=true <cr>",
        desc = "trouble workspace diagnostics",
      },
      {
        "<leader>ds",
        "<cmd> Trouble diagnostics toggle filter.buf=0 focus=true <cr>",
        desc = "trouble buffer diagnostics",
      },
      -- todo: disable this and use lspsaga after bug fix
      {
        "<leader>co",
        "<cmd> Trouble symbols toggle focus=true win.position=right <cr>",
        desc = "trouble document symbols",
      },
      {
        "gr",
        "<cmd> Trouble lsp_references focus=true <cr>",
        desc = "LSP show references",
      },
      {
        "gi",
        "<cmd> Trouble lsp_implementations focus=true <cr>",
        desc = "LSP go to implementation",
      },
      {
        "gd",
        "<cmd> Trouble lsp_definitions focus=true <cr>",
        desc = "LSP go to definitions",
      },
      {
        "gD",
        "<cmd> Trouble lsp_declarations focus=true <cr>",
        desc = "LSP go to declarations",
      },
    },
  },
}
