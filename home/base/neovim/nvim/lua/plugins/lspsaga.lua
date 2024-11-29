return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          virtual_text = false,
        },
        ui = {
          code_action = "",
        },
      }
    end,
    keys = {
      -- todo: enable after bug fix
      -- {
      --   "<leader>co",
      --   "<cmd> Lspsaga outline <cr>",
      --   desc = "lspsaga outline",
      -- },
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
          require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
        end,
        desc = "lspsaga diagnostic next error",
      },
      {
        "[e",
        function()
          require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
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
    },
  },
}
