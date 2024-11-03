return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- format on save
    opts = require "configs.conform",
  },

  -- disable nvchad default plugins
  { "windwp/nvim-autopairs",   enabled = false },
  { "williamboman/mason.nvim", enabled = false },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- make it not lazy but instant
  { "folke/which-key.nvim", lazy = false },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "vimdoc", "nix", "bash", "ssh_config", "ini", "editorconfig",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "nginx", "just", "dockerfile", "sql", "terraform", "proto", "mermaid",
        "c", "cpp", "c_sharp", "python", "rust", "wgsl", "wgsl_bevy", "lua",
        "html", "css", "javascript", "typescript", "yaml", "toml", "json",
        "markdown", "markdown_inline",
      },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configration here, or leave empty to use defaults
      })
    end
  },

  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },
}
