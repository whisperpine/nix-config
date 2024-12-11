-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tomorrow_night",
}

M.ui = {
  statusline = {
    enabled = true,
    -- default/vscode/vscode_colored/minimal
    theme = "default",
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
  },

  tabufline = {
    lazyload = false,
  },

  cmp = {
    -- only for non-atom styles!
    icons_left = true,
    lspkind_text = true,
    -- default/flat_light/flat_dark/atom/atom_colored
    style = "default",
    format_colors = {
      -- will work for css lsp too
      tailwind = true,
      icon = "󱓻",
    },
  },
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.5, vsp = 0.5, ["bo sp"] = 0.5, ["bo vsp"] = 0.5 },
  float = {
    relative = "editor",
    row = 0.05,
    col = 0.0,
    width = 1.0,
    height = 0.80,
    border = "single",
  },
}

return M
