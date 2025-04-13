local plugin = {}

plugin = {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/which-key.nvim",
  },
}

plugin.init = function()
  local wk = require "which-key"
  wk.add {
    { "<leader>ro", icon = { icon = "󰙅 ", color = "blue" } },
  }
end

plugin.keys = {
  {
    "<leader>ro",
    function()
      require("oil").open_float()
    end,
    desc = "oil open float",
  },
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

return plugin
