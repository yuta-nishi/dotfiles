local wezterm = require("wezterm")
local act = wezterm.action

return {
	keys = {
		-- screen
		{
			key = "f",
			mods = "CMD|CTRL",
			action = act.ToggleFullScreen,
		},
		{
			key = "UpArrow",
			mods = "CMD",
			action = act.ScrollByPage(-0.5),
		},
		{
			key = "DownArrow",
			mods = "CMD",
			action = act.ScrollByPage(0.5),
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
		},
		-- text
		{
			key = "b",
			mods = "OPT",
			action = act.SendString("\x1bb"),
		},
		{
			key = "f",
			mods = "OPT",
			action = act.SendString("\x1bf"),
		},
		{
			key = "LeftArrow",
			mods = "CMD",
			action = act.SendString("\x01"),
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = act.SendString("\x05"),
		},
		{
			key = "Backspace",
			mods = "CTRL",
			action = act.SendKey({
				key = "w",
				mods = "CTRL",
			}),
		},
		{
			key = "Backspace",
			mods = "CMD",
			action = act.SendKey({
				key = "u",
				mods = "CTRL",
			}),
		},
		-- copy mode
		{
			key = "c",
			mods = "CMD|SHIFT",
			action = act.ActivateCopyMode,
		},
	},
}
