-- WezTerm Keybindings Documentation by dragonlobster
-- ===================================================
-- Leader Key:
-- The leader key is set to CTRL + b, with a timeout of 2000 milliseconds (2 seconds).
-- To execute any keybinding, press the leader key (CTRL + b) first, then the corresponding key.

-- Keybindings:
-- 1. Tab Management:
--    - LEADER + c: Create a new tab in the current pane's domain.
--    - LEADER + x: Close the current pane (with confirmation).
--    - LEADER + b: Switch to the previous tab.
--    - LEADER + n: Switch to the next tab.
--    - LEADER + <number>: Switch to a specific tab (0–9).

-- 2. Pane Splitting:
--    - LEADER + s Split the current pane horizontally into two panes.
--    - LEADER + v: Split the current pane vertically into two panes.
-- 3. Pane Navigation:
--    - LEADER + h: Move to the pane on the left.
--    - LEADER + j: Move to the pane below.
--    - LEADER + k: Move to the pane above.
--    - LEADER + l: Move to the pane on the right.

-- 4. Pane Resizing:
--    - LEADER + LeftArrow: Increase the pane size to the left by 5 units.
--    - LEADER + RightArrow: Increase the pane size to the right by 5 units.
--    - LEADER + DownArrow: Increase the pane size downward by 5 units.
--    - LEADER + UpArrow: Increase the pane size upward by 5 units.

-- 5. Status Line:
--    - The status line indicates when the leader key is active, displaying an ocean wave emoji (🌊).

-- Miscellaneous Configurations:
-- - Tabs are shown even if there's only one tab.
-- - The tab bar is located at the bottom of the terminal window.
-- - Tab and split indices are one-based.

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Load tabline.wez plugin
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

-- max fps
config.max_fps = 240
config.animation_fps = 240

--[[
============================
Custom Configuration
============================
]]
--

-- Rounded or Square Style Tabs

-- change to square if you don't like rounded tab style
local tab_style = "square"

-- leader active indicator prefix
local leader_prefix = utf8.char(0x1f30a) -- ocean wave

--[[
============================
Font
============================
]]
--

-- config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font Mono Bold" })

-- config.font = wezterm.font_with_fallback({ "JetBrainsMonoNL Nerd Font" })

config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMonoNL Nerd Font",
		-- weight = "SemiBold",
	},
})

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "CaskaydiaMono Nerd Font Mono",
-- 		-- family = "JetBrainsMonoNL Nerd Font",
-- 		-- , weight = "SemiBold"
-- 	},
-- })

config.font_size = 12

config.window_decorations = "RESIZE"

--[[
============================
Colors
============================
]]
--

-- Background image
--config.window_background_image = "C:/Users/kunwa/Downloads/wallhaven-76edpv_1920x1080.png"
-- Adjust image appearance for readability
-- config.window_background_image_hsb = {
--	brightness = 0.03, -- lower = darker image
--	hue = 1.0,
--	saturation = 1.0,
-- }

-- Optional: slight transparency for a softer look
config.window_background_opacity = 0.95
-- config.window_background_opacity = 1.0

-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "Catppuccin Macchiato"
-- color_scheme not sufficient in providing available colors
-- local colors = wezterm.color.get_builtin_schemes()[color_scheme]

-- color scheme colors for easy access
local scheme_colors = {
	catppuccin = {
		macchiato = {
			rosewater = "f4dbd6",
			flamingo = "f0c6c6",
			pink = "f5bde6",
			mauve = "c6a0f6",
			red = "ed8796",
			maroon = "ee99a0",
			peach = "#f5a97f",
			yellow = "#eed49f",
			green = "#a6da95",
			teal = "#8bd5ca",
			sky = "#91d7e3",
			sapphire = "#7dc4e4",
			blue = "#8aadf4",
			lavender = "#b7bdf8",
			text = "#cad3f5",
			crust = "#181926",
		},
	},
}

local colors = {
	border = scheme_colors.catppuccin.macchiato.lavender,
	tab_bar_active_tab_fg = scheme_colors.catppuccin.macchiato.mauve,
	tab_bar_active_tab_bg = scheme_colors.catppuccin.macchiato.crust,
	tab_bar_text = scheme_colors.catppuccin.macchiato.crust,
	arrow_foreground_leader = scheme_colors.catppuccin.macchiato.lavender,
	arrow_background_leader = scheme_colors.catppuccin.macchiato.crust,
}

--[[
============================
Border
============================
]]
--

config.window_frame = {
	border_left_width = "0.4cell",
	border_right_width = "0.4cell",
	border_bottom_height = "0.15cell",
	border_top_height = "0.15cell",
	border_left_color = colors.border,
	border_right_color = colors.border,
	border_bottom_color = colors.border,
	border_top_color = colors.border,
}

-- Pane border configuration
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

-- Inactive pane appearance
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

-- Pane border colors and size
config.colors = {
	-- You can add more color customizations here if needed
	split = colors.border, -- Color of the split/pane borders
}

-- Note: The actual border SIZE between panes is controlled by the font rendering
-- To make borders MORE visible, you can adjust inactive_pane_hsb settings above
-- A thicker visual separation can be achieved by dimming inactive panes more

--[[
============================
Shortcuts
============================
]]
--

-- shortcut_configuration
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "v",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "s",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
}

for i = 1, 9 do
	-- leader + number to activate that tab (1-based indexing)
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- leader + 0 to activate tab 10
table.insert(config.keys, {
	key = "0",
	mods = "LEADER",
	action = wezterm.action.ActivateTab(9),
})

--[[
============================
Tabline.wez Configuration
============================
]]
--

-- Custom function to show leader indicator only when active
local function leader_mode_indicator(window)
	if window:leader_is_active() then
		return leader_prefix .. " LEADER"
	end
	return ""
end

-- Configure tabline.wez with your preferred settings
tabline.setup({
	options = {
		icons_enabled = true,
		theme = "GruvboxDarkHard", -- Match your color scheme
		tabs_enabled = true,
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divider,
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		tabline_a = { leader_mode_indicator },
		tabline_b = { "workspace" },
		tabline_c = { " " },
		tab_active = {
			"index",
			{ "parent", padding = 0 },
			"/",
			{ "cwd", padding = { left = 0, right = 1 } },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = { "ram", "cpu" },
		tabline_y = { "datetime", "battery" },
		tabline_z = { "hostname" },
	},
	extensions = {},
})

-- Apply tabline recommended settings to config
tabline.apply_to_config(config)

-- Override specific settings from tabline if needed
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.tab_and_split_indices_are_zero_based = false

config.front_end = "WebGpu"
-- and finally, return the configuration to wezterm
return config
