local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

config.default_cwd = "D:\\dengzengxiao_projects\\cpp"
config.default_prog = { "C:\\Users\\Shawn\\AppData\\Local\\Programs\\nu\\bin\\nu.exe", "-l" }

config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "LXGW WenKai Mono" })
config.font_size = 14
config.color_scheme = "Tokyo Night"

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600
config.cursor_blink_ease_out = "Linear"

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().active
	local width, height = screen.width * 0.5, screen.height * 0.5
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = {
			x = (screen.width - width) / 2,
			y = (screen.height - height) / 2,
			origin = { Named = screen.name },
		},
	})
	window:gui_window():set_inner_size(width, height)
end)
config.window_background_opacity = 0.95

return config
