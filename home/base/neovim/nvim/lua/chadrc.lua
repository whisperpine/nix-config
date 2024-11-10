-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tomorrow_night",
  hl_override = {},
}

M.ui = {
  telescope = { style = "borderless" }, -- borderless / bordered

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
}

return M
