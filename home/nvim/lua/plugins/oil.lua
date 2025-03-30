local plugin = {}

plugin = {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

plugin.opts = {
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
}

plugin.keys = {
  {
    "<leader>ro",
    function()
      require("oil").open_float()
    end,
    desc = "oil open float",
  },
}

return plugin
