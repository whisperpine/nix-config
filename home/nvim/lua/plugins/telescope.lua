local M = {}

M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = "Telescope",
}

M.init = function()
  if vim.fn.filereadable(vim.g.base46_cache .. "telescope") == 1 then
    dofile(vim.g.base46_cache .. "telescope")
  end
end

M.opts = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    -- require() will make lazy.nvim load this plugin on startup
    -- even "lazy=true" is set, which adds startup latency.
    mappings = {
      -- n = { ["q"] = require("telescope.actions").close },
      -- i = { ["<Esc>"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
}

M.keys = {
  {
    "<leader>fw",
    "<cmd> Telescope live_grep <cr>",
    desc = "telescope live grep",
  },
  {
    "<leader>fb",
    "<cmd> Telescope buffers <cr>",
    desc = "telescope find buffers",
  },
  {
    "<leader>fh",
    "<cmd> Telescope help_tags <cr>",
    desc = "telescope help page",
  },
  {
    "<leader>fo",
    "<cmd> Telescope oldfiles <cr>",
    desc = "telescope find oldfiles",
  },
  {
    "<leader>fz",
    "<cmd> Telescope current_buffer_fuzzy_find <cr>",
    desc = "telescope find in current buffer",
  },
  {
    "<leader>fm",
    "<cmd> Telescope git_bcommits <cr>",
    desc = "telescope git buffer commits",
  },
  {
    "<leader>fg",
    "<cmd> Telescope git_status <cr>",
    desc = "telescope git status",
  },
  -- {
  --   "<leader>ft",
  --   "<cmd> Telescope terms <cr>",
  --   desc = "telescope pick hidden term",
  -- },
  -- {
  --   "<leader>th",
  --   function()
  --     require("nvchad.themes").open()
  --   end,
  --   desc = "telescope nvchad themes",
  -- },
  {
    "<leader>ff",
    function()
      require("telescope.builtin").find_files {
        find_command = { "fd", "--type", "f", "--hidden", "--no-ignore-vcs" },
      }
    end,
    desc = "telescope find files",
  },
  {
    "<leader>fa",
    function()
      require("telescope.builtin").find_files {
        find_command = {
          "fd",
          "--type",
          "f",
          "--hidden",
          "--no-ignore",
          "--exclude",
          ".git",
        },
      }
    end,
    desc = "telescope find all files",
  },
}

return M
