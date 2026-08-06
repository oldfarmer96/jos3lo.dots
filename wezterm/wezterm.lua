local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe" }

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13.0

config.background = {
	{
		source = {
			File = "C:/Users/enma/Pictures/wall/wall-2.png",
		},

		width = "100%",
		height = "100%",

		--  hsb = {
		--    hue = 1.0,
		--    saturation = 1.0,
		--    brightness = 0.25,
		--   },
	},

	-- Capa oscura encima de la imagen para leer mejor
	-- {
	--   source = {
	--     Color = "#000",
	--   },

	--   width = "100%",
	--   height = "100%",
	--   opacity = 0.30,
	-- },
}

config.window_padding = {
	top = 2,
	right = 2,
	left = 4,
	bottom = 2,
}

-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- config.default_cursor_style = "BlinkingBar"
-- config.cursor_blink_rate = 500

config.max_fps = 120
config.animation_fps = 60

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.tab_max_width = 32

config.hyperlink_rules = {
	{
		regex = "\\((\\w+://\\S+)\\)",
		format = "$1",
		highlight = 1,
	},
	{
		regex = "\\[(\\w+://\\S+)\\]",
		format = "$1",
		highlight = 1,
	},
	{
		regex = "\\{(\\w+://\\S+)\\}",
		format = "$1",
		highlight = 1,
	},
	{
		regex = "<(\\w+://\\S+)>",
		format = "$1",
		highlight = 1,
	},
	{
		regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
		format = "$1",
		highlight = 1,
	},
	{
		regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
		format = "mailto:$0",
	},
}

-- config.keys = {
--   -- Cambiar pestaña con Alt + flechas
--   {
--     key = "LeftArrow",
--     mods = "ALT",
--     action = act.ActivateTabRelative(-1),
--   },
--   {
--     key = "RightArrow",
--     mods = "ALT",
--     action = act.ActivateTabRelative(1),
--   },

--   -- Ir directamente a una pestaña con Alt + número
--   {
--     key = "1",
--     mods = "ALT",
--     action = act.ActivateTab(0),
--   },
--   {
--     key = "2",
--     mods = "ALT",
--     action = act.ActivateTab(1),
--   },
--   {
--     key = "3",
--     mods = "ALT",
--     action = act.ActivateTab(2),
--   },
--   {
--     key = "4",
--     mods = "ALT",
--     action = act.ActivateTab(3),
--   },
--   {
--     key = "5",
--     mods = "ALT",
--     action = act.ActivateTab(4),
--   },
--   {
--     key = "6",
--     mods = "ALT",
--     action = act.ActivateTab(5),
--   },
--   {
--     key = "7",
--     mods = "ALT",
--     action = act.ActivateTab(6),
--   },
--   {
--     key = "8",
--     mods = "ALT",
--     action = act.ActivateTab(7),
--   },
--   {
--     key = "9",
--     mods = "ALT",
--     action = act.ActivateTab(8),
--   },

--   -- Nueva ventana
--   {
--     key = "n",
--     mods = "CTRL|SHIFT",
--     action = act.SpawnWindow,
--   },

--   -- Pantalla completa
--   {
--     key = "Enter",
--     mods = "ALT",
--     action = act.ToggleFullScreen,
--   },

--   -- Recargar configuración
--   {
--     key = "r",
--     mods = "CTRL|SHIFT",
--     action = act.ReloadConfiguration,
--   },

--   -- Paleta de comandos
--   {
--     key = "p",
--     mods = "CTRL|SHIFT",
--     action = act.ActivateCommandPalette,
--   },

--   -- Copiar
--   {
--     key = "c",
--     mods = "CTRL|SHIFT",
--     action = act.CopyTo("Clipboard"),
--   },

--   -- Pegar
--   {
--     key = "v",
--     mods = "CTRL|SHIFT",
--     action = act.PasteFrom("Clipboard"),
--   },

--   -- Aumentar tamaño de letra
--   {
--     key = "+",
--     mods = "CTRL",
--     action = act.IncreaseFontSize,
--   },

--   -- Disminuir tamaño de letra
--   {
--     key = "-",
--     mods = "CTRL",
--     action = act.DecreaseFontSize,
--   },

--   -- Restaurar tamaño de letra
--   {
--     key = "0",
--     mods = "CTRL",
--     action = act.ResetFontSize,
--   },
-- }

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("format-tab-title", function(tab)
	return {
		{ Text = string.format("  %d ", tab.tab_index + 1) },
	}
end)

return config
