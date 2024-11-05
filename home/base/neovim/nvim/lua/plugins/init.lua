return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    opts = require "configs.conform",
  },

  -- disable nvchad default plugins
  { "windwp/nvim-autopairs", enabled = false },
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
      -- all the supported languages by tree-sitter:
      -- https://github.com/nvim-treesitter/nvim-treesitter
      ensure_installed = {
        "markdown_inline",
        "markdown",
        "javascript",
        "typescript",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "editorconfig",
        "ssh_config",
        "dockerfile",
        "terraform",
        "mermaid",
        "wgsl_bevy",
        "wgsl",
        "c_sharp",
        "python",
        "vimdoc",
        "vim",
        "proto",
        "nix",
        "bash",
        "ini",
        "nginx",
        "just",
        "sql",
        "cpp",
        "rust",
        "lua",
        "html",
        "css",
        "yaml",
        "toml",
        "json",
        "nu",
        "c",
      },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- config here or leave empty to use defaults
      }
    end,
  },

  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      -- Your setup opts here
    },
  },
}
