local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Builtin Solarized Dark"
	else
		return "Builtin Solarized Light"
	end
end

config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
})

config.font_size = 14.0
config.line_height = 1.0

config.hide_tab_bar_if_only_one_tab = true
config.keys = {
	{ key = "LeftArrow", mods = "SUPER", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "SUPER", action = act.ActivateTabRelative(1) },
	{ key = "LeftArrow", mods = "SUPER|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "SUPER|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "LeftArrow", mods = "OPT", action = act.SendString("\x1bb") },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = act.SendString("\x1bf") },
}

config.audible_bell = "Disabled"
config.enable_scroll_bar = true
config.scrollback_lines = 100000
config.enable_kitty_keyboard = true

-- Theme
config.color_scheme = scheme_for_appearance(get_appearance())

return config
