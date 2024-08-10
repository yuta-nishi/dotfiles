local wezterm = require "wezterm"

local config = wezterm.config_builder()

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

-- color
config.color_scheme = "dracula"
config.window_background_opacity = 0.85

-- font
config.font_size = 14.0
config.font = wezterm.font("Hack Nerd Font")

return config
