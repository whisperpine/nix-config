-- Pull in the wezterm API.
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.front_end = "WebGpu"

-- This makes typing in Zellij fluent (the default is 60 fps).
config.max_fps = 120

-- x86_64-pc-windows-msvc - Windows
-- x86_64-apple-darwin - macOS (Intel)
-- aarch64-apple-darwin - macOS (Apple Silicon)
-- x86_64-unknown-linux-gnu - Linux
local target_triple = wezterm.target_triple
if string.find(target_triple, "windows") then
	config.default_prog = { "nu", "-l" }
end

-- config.color_scheme = "Tomorrow Night"
config.colors = require("src.colors")

local keymap_mod = require("src.keymap")
keymap_mod.apply_to_config(config)

local window_mod = require("src.window")
window_mod.apply_to_config(config)

local font_mod = require("src.font")
font_mod.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
