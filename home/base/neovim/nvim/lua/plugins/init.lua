return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  { "neovim/nvim-lspconfig", enabled = false },

  { "williamboman/mason.nvim", enabled = false },

  {
    "folke/which-key.nvim",
    lazy = false
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",  "vimdoc", "nix", "bash", "ssh_config", "ini",
        "html", "css", "javascript", "typescript", "nginx",
        "c", "cpp", "c_sharp", "python", "rust", "wgsl", "wgsl_bevy",
        "yaml", "toml", "json", "just", "dockerfile", "sql",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore"
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
