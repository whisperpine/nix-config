return {
  -- disable plugins brought from nvchad
  { "windwp/nvim-autopairs", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },

  {
    "L3MON4D3/LuaSnip",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require "nvchad.configs.luasnip"
      require("luasnip.loaders.from_vscode").load {
        paths = { "./snippets" },
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local my_config = require "configs.nvim-tree"
      local nvchad_config = require "nvchad.configs.nvimtree"
      return vim.tbl_deep_extend("force", nvchad_config, my_config)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local my_config = require "configs.nvim-treesitter"
      local nvchad_config = require "nvchad.configs.treesitter"
      return vim.tbl_deep_extend("force", nvchad_config, my_config)
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
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
    dependencies = { "wellle/targets.vim" },
    event = "BufReadPost",
    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    event = "BufReadPost",
    opts = require "configs.render-markdown",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "sh -c 'cd app && yarn install && git restore .'",
    init = function(_)
      vim.g.mkdp_filetypes = { "markdown" }
      vim.api.nvim_set_var("mkdp_auto_close", 0)
      vim.api.nvim_set_var("mkdp_combine_preview", 1)
    end,
    ft = { "markdown" },
  },

  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      }
      local lint_events = { "BufWritePost", "BufReadPost", "InsertLeave" }
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
    opts = {
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
    },
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        -- fade, fade_in_slide_out, no_animation, slide, static
        stages = "static",
        -- default, minimal, simple, compact
        render = "compact",
        background_colour = "FloatShadow",
        timeout = 5000,
      }
      vim.notify = require "notify"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "configs.noice",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- `nvim-notify` is only needed, if you want to use the notification view.
      -- If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    opts = function()
      local os_info = vim.loop.os_uname()
      if os_info.sysname == "Windows" then
        -- be sure that im-select.exe has been added to env var "Path"
        return { default_command = "im-select.exe" }
      elseif os_info.sysname == "Linux" and vim.fn.has "wsl" == 1 then
        -- todo: use environment variable to get the path of executable file
        return { default_command = "/mnt/c/Users/yusong/external/bin/im-select.exe" }
      end
    end,
  },
}
