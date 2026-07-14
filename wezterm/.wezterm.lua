local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end
local seen_windows = {}

wezterm.on("window-focus-changed", function(window, pane)
	local win_id = window:window_id()
	if not seen_windows[win_id] then
		seen_windows[win_id] = true
		window:maximize()
	end
end)

config.default_domain = "WSL:archlinux"
config.default_cwd = "~"
config.default_cursor_style = "SteadyBar"
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.font_size = 10
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
--config.font = wezterm.font("Consolas", { weight = "Bold" })
config.enable_tab_bar = false
config.window_padding = {
	left = 5,
	right = 0,
	top = 2,
	bottom = 0,
}
--config.win32_system_backdrop = 'Auto'
config.win32_system_backdrop = "Disable"
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0
config.window_background_image = "C:\\Users\\vtkiet1011\\Pictures\\csm-wallpaper.png"
-- Optional: Darken or lighten the image so you can still read your text
config.window_background_image_hsb = {
	-- Darken the image by setting brightness to a lower value (e.g., 0.3)
	brightness = 0.1,
	-- You can also adjust hue and saturation here
	hue = 1.0,
	saturation = 1.0,
}
config.front_end = "OpenGL"
config.keys = {
	{ key = "Enter", mods = "CTRL", action = wezterm.action({ SendString = "\x1b[13;5u" }) },
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b[13;2u" }) },

	{
		key = "N",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnCommandInNewWindow({
			domain = { DomainName = "WSL:archlinux" },
			cwd = "~",
		}),
	},
}

config.hyperlink_rules = {
	-- Matches: a URL in parens: (URL)
	{
		regex = "\\((\\w+://\\S+)\\)",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in brackets: [URL]
	{
		regex = "\\[(\\w+://\\S+)\\]",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in curly braces: {URL}
	{
		regex = "\\{(\\w+://\\S+)\\}",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in angle brackets: <URL>
	{
		regex = "<(\\w+://\\S+)>",
		format = "$1",
		highlight = 1,
	},
	-- Then handle URLs not wrapped in brackets
	{
		regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
		format = "$1",
		highlight = 1,
	},
}
return config
