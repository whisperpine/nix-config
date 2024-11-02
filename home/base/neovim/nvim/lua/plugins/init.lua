return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- format on save
    opts = require "configs.conform",
  },

  -- disable nvchad default plugins
  { "windwp/nvim-autopairs", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },
  { "williamboman/mason.nvim", enabled = false },

  -- make it not lazy but instant
  { "folke/which-key.nvim", lazy = false },

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
