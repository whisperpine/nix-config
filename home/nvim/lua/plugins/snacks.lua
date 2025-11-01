local plugin = {}

plugin = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

plugin.opts = {
  -- image = { enabled = true }, -- image viewer using Kitty Graphics Protocol
  bigfile = { enabled = true }, -- prevents LSP attaching to bigfile
  input = { enabled = true }, -- better `vim.ui.input` (e.g. when renaming)
  picker = { enabled = true, prompt = "" }, -- a modern fuzzy-finder akin to telescope
  scope = { enabled = true }, -- scope detection based on treesitter or indent
  words = { enabled = true }, -- auto-show LSP references and quickly navigate between them
  gh = { enabled = true }, -- github cli integration
}

plugin.keys = {
  {
    "<leader>gi",
    function()
      require("snacks").picker.gh_issue()
    end,
    desc = "github issues (open)",
  },
  {
    "<leader>gI",
    function()
      require("snacks").picker.gh_issue { state = "all" }
    end,
    desc = "github issues (all)",
  },
  {
    "<leader>gp",
    function()
      require("snacks").picker.gh_pr()
    end,
    desc = "github pull requests (open)",
  },
  {
    "<leader>gP",
    function()
      require("snacks").picker.gh_pr { state = "all" }
    end,
    desc = "github pull requests (all)",
  },
}

return plugin
