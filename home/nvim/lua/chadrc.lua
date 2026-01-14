-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available option.

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tomorrow_night",

  -- Copy highlight groups to an empty buffer:
  -- ":redir @a | silent hi | redir END | new | put a"
  hl_override = {
    -- Include = { fg = "#679cd6" },
    CursorLine = { bg = "#313131" },
    NvimTreeCursorLine = { bg = "#313131" },
    TelescopeSelection = { fg = "NONE", bg = "#3f3f3f" },
    LspInlayHint = { fg = "#7b7b7b", bg = "#2a2a2a" },
    LspSignatureActiveParameter = { fg = "NONE", bg = "#4a4a4a" },
    TroublePreview = { fg = "NONE", bg = "#4a4a4a" },
    ["@keyword.repeat"] = { link = "@keyword" }, -- e.g. "for" and "loop" in rust
    ["@keyword.exception"] = { link = "@keyword" }, -- e.g. "try" and "except" in python
    ["@module"] = { fg = "#8ab689" }, -- e.g. module of rust, python, javascript
    ["@variable"] = { fg = "#cc6666" },
    ["@variable.member"] = { link = "@variable" }, -- e.g. rust struct elements, python class attributes
    ["@property"] = { link = "@variable" }, -- e.g. "fg" in this line
    ["@function.macro"] = { fg = "#8aa0ea" }, -- e.g. rust procedural macros
    ["@constant.macro"] = { link = "@function.macro" }, -- e.g. rust declarative macros
    ["@variable.parameter"] = { link = "@operator" }, -- e.g. parameters in function signature
    ["@punctuation.delimiter"] = { link = "@operator" },
    ["@markup.quote"] = { bg = "#202020" },
    ["@string"] = { fg = "#abb262" },
  },

  -- Change attributes of theme.
  changed_themes = {
    ---@diagnostic disable-next-line: missing-fields
    all = {},
    tomorrow_night = {
      ---@diagnostic disable-next-line: missing-fields
      base_30 = {
        black = "#202020", -- background
        darker_black = "#202020", -- nvimtree bg, floating term bg
        statusline_bg = "#2a2a2a",
        black2 = "#2a2a2a", -- tabufline, telescope search bg
        grey_fg = "#717171", -- comments
      },
      -- https://github.com/chriskempson/base16/blob/main/styling.md
      ---@diagnostic disable-next-line: missing-fields
      base_16 = {
        base00 = "#202020", -- default background
        base01 = "#161616", -- lighter background
        base02 = "#3b3b3b", -- selection background
      },
    },
  },

  -- Extra integrations.
  -- Compiled files are located under "~/.local/share/nvim/base46".
  -- Note: REINSTALL "base46" plugin after altering this attribute.
  integrations = { "avante", "trouble" },
}

M.ui = {
  statusline = {
    enabled = true,
    -- Can be either: default, vscode, vscode_colored, minimal.
    theme = "default",
    -- The "default, round, block, arrow" separators work only for default statusline theme.
    -- Round and block will work for minimal theme only.
    separator_style = "block",
  },

  tabufline = {
    lazyload = false,
  },

  cmp = {
    -- Only for non-atom styles!
    icons_left = true,
    -- Can be either: default, flat_light, flat_dark, atom, atom_colored.
    style = "default",
    -- For tailwind, css, lsp, etc.
    format_colors = {
      lsp = true,
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
    -- Can be either: single, double, rounded, solid, shadow, none.
    border = "single",
  },
}

return M
