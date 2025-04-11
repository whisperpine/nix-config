return {
  --########## nvchad below ##########--
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
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
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
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = require "configs.nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
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
    -- "stevearc/conform.nvim",
    "whisperpine-contrib/conform.nvim",
    -- dir = "~/projects/forked/conform.nvim",
    event = "BufReadPost",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/which-key.nvim",
    lazy = false,
    cmd = "WhichKey",
    init = function()
      dofile(vim.g.base46_cache .. "whichkey")
    end,
    opts = { delay = 0 },
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
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
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      { "<leader>fn", "<cmd> Telescope notify <cr>", desc = "telescope notify" },
    },
  },

  {
    "keaising/im-select.nvim",
    event = "InsertLeave",
    opts = function()
      local options = {
        -- Restore the previous used input method state when the following events
        -- are triggered. If you don't want to restore previous used input method in Insert mode,
        -- just let it empty as `set_previous_events = {}`.
        set_previous_events = {},
      }
      local os_info = vim.loop.os_uname()
      if os_info.sysname == "Windows" then
        -- be sure that `im-select.exe` has been added to env var "Path"
        options.default_command = "im-select.exe"
      elseif os_info.sysname == "Darwin" then
        -- be sure that `im-select` has been added to env var "PATH"
        options.default_command = "im-select"
      elseif os_info.sysname == "Linux" and vim.fn.has "wsl" == 1 then
        -- todo: use environment variable to get the path of executable file
        options.default_command = "/mnt/c/Users/yusong/external/bin/im-select.exe"
      end
      return options
    end,
  },

  {
    -- dir = "~/projects/whisperpine/quickfix-messages.nvim",
    "whisperpine/quickfix-messages.nvim",
    cmd = "QuickfixMessages",
    opts = {
      -- automatically open quickfix window
      open_quickfix = true,
    },
  },
}
