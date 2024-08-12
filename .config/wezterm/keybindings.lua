local wezterm = require "wezterm"
local act = wezterm.action

return {
  keys = {
    -- screen
    {
      key = "f",
      mods = "CMD|CTRL",
      action = act.ToggleFullScreen,
    },
    -- pane
    {
      key = "d",
      mods = "CMD",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "h",
      mods = "CMD",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentPane({ confirm = true }),
    },
    {
      key = "h",
      mods = "OPT",
      action = act.ActivatePaneDirection("Left"),
    },
    {
      key = "j",
      mods = "OPT",
      action = act.ActivatePaneDirection("Down"),
    },
    {
      key = "k",
      mods = "OPT",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "l",
      mods = "OPT",
      action = act.ActivatePaneDirection("Right"),
    }
  }
}
