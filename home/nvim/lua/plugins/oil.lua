local M = {}

M = {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/which-key.nvim",
  },
}

M.init = function()
  local wk = require "which-key"
  wk.add {
    { "<leader>ro", icon = { icon = "󰙅 ", color = "blue" } },
  }
end

M.keys = {
  {
    "<leader>ro",
    function()
      require("oil").open_float()
    end,
    desc = "oil open float",
  },
}

M.opts = {
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
  -- Add additional keymaps.
  keymaps = {
    ["q"] = { "actions.close", mode = "n" },
    ["h"] = { "actions.parent", mode = "n" },
    ["l"] = { "actions.select", mode = "n" },
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    border = "single",
  },
}

return M
