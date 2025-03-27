return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      -- defaults = {
      --   mappings = {
      --     i = {
      --       ["<Esc>"] = require("telescope.actions").close,
      --     },
      --   },
      -- },
    },
    keys = {
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
      {
        "<leader>ft",
        "<cmd> Telescope terms <cr>",
        desc = "telescope pick hidden term",
      },
      {
        "<leader>th",
        function()
          require("nvchad.themes").open()
        end,
        desc = "telescope nvchad themes",
      },
      {
        "<leader>ff",
        "<cmd> Telescope find_files <cr>",
        desc = "telescope find files",
      },
      {
        "<leader>fa",
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>",
        desc = "telescope find all files",
      },
    },
  },
}
