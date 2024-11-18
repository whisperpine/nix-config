return {

  -- disable nvchad default plugins
  { "windwp/nvim-autopairs", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      -- return require "configs.nvim-tree"
      return vim.tbl_deep_extend("force", require "nvchad.configs.nvimtree", require "configs.nvim-tree")
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    ---@diagnostic disable-next-line: different-requires
    opts = require "configs.conform",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      conf.defaults.mappings.i = {
        ["<Esc>"] = require("telescope.actions").close,
      }
      return conf
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/which-key.nvim",
    lazy = false,
    opts = { delay = 0 },
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
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "sh -c 'cd app && yarn install && git restore .'",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      local lint_events = { "BufWritePost", "BufReadPost", "InsertLeave" }
      require("lint").linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      }
      vim.api.nvim_create_autocmd(lint_events, {
        callback = function()
          -- try_lint without arguments runs the linters defined
          -- in `linters_by_ft` for the current filetype
          require("lint").try_lint()
        end,
      })
    end,
  },

  {
    "fei6409/log-highlight.nvim",
    event = "BufReadPost",
    config = function()
      require("log-highlight").setup {
        -- The following options support either a string or a table of strings.
        -- The file extensions.
        extension = "log",
        -- The file names or the full file paths.
        filename = { "messages" },
        -- The file path glob patterns, e.g. `.*%.lg`, `/var/log/.*`.
        -- Note: `%.` is to match a literal dot (`.`) in a pattern in Lua, but most
        -- of the time `.` and `%.` here make no observable difference.
        pattern = {
          "/var/log/.*",
          "messages%..*",
        },
      }
    end,
  },
}
