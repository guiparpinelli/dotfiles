-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'rose-pine'
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
