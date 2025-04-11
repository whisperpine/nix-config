-- default keys: https://wezfurlong.org/wezterm/config/default-keys.html

local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

local act = wezterm.action
local keymap = {
	{ key = "l", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
	{ key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	{ key = "n", mods = "CTRL|SHIFT", action = act.SpawnWindow },
	{ key = "x", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
	{ key = "f", mods = "CTRL|SHIFT", action = act.Search({ CaseInSensitiveString = "" }) },
	{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "q", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "c", mods = "CTRL|SHIFT", action = act({ CopyTo = "Clipboard" }) },
	{ key = "c", mods = "SUPER", action = act({ CopyTo = "Clipboard" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = act({ PasteFrom = "Clipboard" }) },
	{ key = "v", mods = "SUPER", action = act({ PasteFrom = "Clipboard" }) },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "PageUp", mods = "SHIFT", action = act({ ScrollByPage = -1 }) },
	{ key = "PageDown", mods = "SHIFT", action = act({ ScrollByPage = 1 }) },
	{ key = "h", mods = "SUPER", action = act.HideApplication },
}

function module.apply_to_config(config)
	config.disable_default_key_bindings = true
	config.keys = keymap
end

return module
