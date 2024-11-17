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

return M
