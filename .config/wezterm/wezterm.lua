local wezterm = require "wezterm"

local config = wezterm.config_builder()

-- color
config.color_scheme = "dracula"
config.window_background_opacity = 0.88

-- font
config.font_size = 14.0
config.font = wezterm.font("Hack Nerd Font")
config.line_height = 1.2

-- scroll
config.enable_scroll_bar = true

-- keybindings
config.keys = require("keybindings").keys

-- screen
config.native_macos_fullscreen_mode = true

return config
