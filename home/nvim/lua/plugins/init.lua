return {
  -- disable plugins brought from nvchad
  { "windwp/nvim-autopairs", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },

  {
    "gitsigns.nvim",
    keys = {
      { "<leader>cr", "<cmd> Gitsigns reset_hunk <cr>", desc = "git reset hunk" },
      { "<leader>cs", "<cmd> Gitsigns stage_hunk <cr>", desc = "git stage hunk" },
    },
  },

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
    keys = {
      { "<C-n>", "<cmd> NvimTreeToggle <cr>", desc = "nvimtree toggle window" },
    },
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
    event = "BufReadPost",
    opts = require "configs.conform",
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
    init = function()
      local wk = require "which-key"
      wk.add {
        { "<leader>mn", icon = { icon = "", color = "grey" } },
        { "<leader>ma", icon = { icon = "", color = "grey" } },
        { "<leader>md", icon = { icon = "", color = "grey" } },
        { "<leader>mi", icon = { icon = "", color = "grey" } },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    dependencies = { "wellle/targets.vim" },
    event = "BufReadPost",
    opts = {},
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
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "markdownlint" },
        javascript = { "biomejs" },
        typescript = { "biomejs" },
        graphql = { "biomejs" },
        json = { "biomejs" },
        css = { "biomejs" },
        jsx = { "biomejs" },
        tsx = { "biomejs" },
      }
      local lint_events = {
        "BufWritePost",
        "BufReadPost",
        "InsertLeave",
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
      -- If you lazy-load any plugin below, make sure to add proper `module="..."` entries.
      "MunifTanjim/nui.nvim",
      -- `nvim-notify` is only needed, if you want to use the notification view.
      -- If not available, we use `mini` as the fallback.
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
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      -- Add additional keymaps.
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["h"] = { "actions.parent", mode = "n" },
        ["l"] = "actions.select",
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        border = "single",
      },
    },
    keys = {
      {
        "<leader>ro",
        function()
          require("oil").open_float()
        end,
        desc = "oil open float",
      },
    },
  },

  -- todo: remove this plugin when neovim is upgraded to 0.11.0
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "BufReadPost",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
}
