return {
  "nvim-lua/plenary.nvim",
  "nvzone/volt",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)
    end,
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = {
        char = "│",
        highlight = "IblScopeChar",
        show_start = false,
        show_end = false,
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = require "configs.nvim-tree",
    keys = {
      { "<C-n>", "<cmd> NvimTreeToggle <cr>", desc = "nvimtree toggle window" },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufReadPost",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
  },

  { "b0o/schemastore.nvim" },

  {
    "nvim-tree/nvim-web-devicons",
    init = function()
      dofile(vim.g.base46_cache .. "devicons")
    end,
    opts = function()
      return { override = require "nvchad.icons.devicons" }
    end,
  },

  {
    "kylechui/nvim-surround",
    dependencies = { "wellle/targets.vim" },
    event = "BufReadPost",
    opts = {},
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- image = { enabled = true }, -- image viewer using Kitty Graphics Protocol
      bigfile = { enabled = true }, -- prevents LSP attaching to bigfile
      input = { enabled = true }, -- better `vim.ui.input` (e.g. when renaming)
      picker = { enabled = true, prompt = "" }, -- a modern fuzzy-finder akin to telescope
      scope = { enabled = true }, -- scope detection based on treesitter or indent
      words = { enabled = true }, -- auto-show LSP references and quickly navigate between them
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufReadPost",
    opts = require "configs.render-markdown",
    ft = { "markdown", "Avante" },
    keys = {
      {
        "<leader>mr",
        "<cmd> RenderMarkdown toggle <cr>",
        desc = "render markdown",
        ft = "markdown",
      },
    },
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
    keys = {
      {
        "<leader>mv",
        "<cmd> MarkdownPreviewToggle <cr>",
        desc = "preview markdown",
        ft = "markdown",
      },
    },
  },

  {
    "fei6409/log-highlight.nvim",
    event = "BufReadPost",
    opts = {
      -- The following options support either a string or a table of strings.
      -- The file extensions.
      extension = "log",
      -- The filenames or the full file paths.
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
    init = function()
      vim.notify = require "notify"
    end,
    opts = {
      -- fade, fade_in_slide_out, no_animation, slide, static
      stages = "static",
      -- default, minimal, simple, compact
      render = "compact",
      background_colour = "FloatShadow",
      timeout = 5000,
      -- config notification window
      on_open = function(win)
        local config = vim.api.nvim_win_get_config(win)
        config.border = "solid"
        vim.api.nvim_win_set_config(win, config)
      end,
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "configs.noice",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      { "<leader>fn", "<cmd> Telescope notify <cr>", desc = "telescope notify" },
    },
  },

  {
    -- dir = "~/projects/whisperpine/quickfix-messages.nvim",
    "whisperpine/quickfix-messages.nvim",
    cmd = "QuickfixMessages",
    opts = {},
  },
}
