return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("lspsaga").setup {}
    end,
    keys = {
      {
        "<leader>co",
        "<cmd> Lspsaga outline <cr>",
        desc = "lspsaga outline",
      },
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
