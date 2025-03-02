local wezterm = require "wezterm"

-- This is the module table that we will export
local module = {}

local target_triple = wezterm.target_triple

local font_normal = wezterm.font_with_fallback {
  { family = "Cascadia Mono", weight = "Regular" },
  { family = "Symbols Nerd Font", scale = 1 },
  { family = "Sarasa Mono SC", weight = "DemiBold" },
}
local font_italic = wezterm.font_with_fallback {
  { family = "Cascadia Mono", weight = "Regular", italic = true },
  { family = "Symbols Nerd Font", scale = 1 },
  { family = "Sarasa Mono SC", weight = "DemiBold", italic = true },
}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
  if string.find(target_triple, "windows") then
    config.font_size = 11.0
  elseif string.find(target_triple, "darwin") then
    config.font_size = 15.0
  end
  config.cell_width = 1.0
  config.line_height = 1.0
  config.font = font_normal
  config.allow_square_glyphs_to_overflow_width = "Always"
  config.font_rules = {
    { intensity = "Normal", italic = false, font = font_normal },
    { intensity = "Normal", italic = true, font = font_italic },
    { intensity = "Bold", italic = false, font = font_normal },
    { intensity = "Bold", italic = true, font = font_italic },
    { intensity = "Half", italic = false, font = font_normal },
    { intensity = "Half", italic = true, font = font_italic },
  }
end

-- return our module table
return module
