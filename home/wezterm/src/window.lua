local wezterm = require "wezterm"

-- This is the module table that we will export.
local module = {}

local target_triple = wezterm.target_triple

wezterm.on("gui-startup", function(cmd)
  if string.find(target_triple, "windows") then
    -- Tab, pane, window.
    local _, _, _ = wezterm.mux.spawn_window(cmd or {
      position = { x = 900, y = 280 },
    })
  elseif string.find(target_triple, "darwin") then
    local _, _, _ = wezterm.mux.spawn_window(cmd or {
      position = { x = 1350, y = 500 },
    })
  end
end)

function module.apply_to_config(config)
  config.enable_tab_bar = false
  config.window_close_confirmation = "NeverPrompt"
  config.window_decorations = "RESIZE"
  if string.find(target_triple, "windows") then
    config.initial_rows = 42
    config.initial_cols = 120
  elseif string.find(target_triple, "darwin") then
    config.initial_rows = 39
    config.initial_cols = 110
  end
  config.window_padding = {
    left = "1.5cell",
    right = "1.5cell",
    top = "0.8cell",
    bottom = "0.2cell",
  }
end

-- Return our module table.
return module
