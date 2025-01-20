local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- general
config.automatically_reload_config = true

-- color
config.color_scheme = "Catppuccin Mocha"

-- font
config.font_size = 14.0
config.font = wezterm.font("Hack Nerd Font")
config.line_height = 1.2

-- scroll
config.enable_scroll_bar = true

-- keys
config.keys = require("keys").keys

-- tab
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 5

-- window
config.background = {
  {
    source = {
      File = wezterm.home_dir .. "/.config/wezterm/evamark6.jpg",
    },
    hsb = {
      brightness = 0.1,
    },
  },
}
config.initial_cols = 120
config.initial_rows = 30
config.macos_window_background_blur = 20
config.native_macos_fullscreen_mode = true
config.window_decorations = "RESIZE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

return config
