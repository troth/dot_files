local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

--config.color_scheme = 'Alabaster'
--config.color_scheme = 'Atelier Forest Light (base16)'
--config.color_scheme = 'Atelier Heath Light (base16)'
--config.color_scheme = 'Atelier Sulphurpool Light (base16)'
--config.color_scheme = 'Atelierforest (light) (terminal.sexy)'
--config.color_scheme = 'Atelierheath (light) (terminal.sexy)'
--config.color_scheme = 'AtomOneLight'
--config.color_scheme = 'Ayu Light (Gogh)'
--config.color_scheme = 'Bluloco Light (Gogh)'
--config.color_scheme = 'BlulocoLight'
--config.color_scheme = 'dayfox'
--config.color_scheme = 'zenbones'
--config.color_scheme = 'farmhouse-light'
--config.color_scheme = 'Humanoid light (base16)'
--config.color_scheme = 'Mexico Light (base16)'
--config.color_scheme = 'Modus-Operandi-Tinted'
--config.color_scheme = 'Novel'
--config.color_scheme = 'primary'
--config.color_scheme = 'Pro Light'
--config.color_scheme = 'Raycast_Light'
--config.color_scheme = 'rose-pine-dawn'
--config.color_scheme = 'Sagelight (base16)'
--config.color_scheme = 'Selenized Light (Gogh)'
--config.color_scheme = 'Shapeshifter (base16)'
--config.color_scheme = 'Silk Light (base16)'
--config.color_scheme = 'Tinacious Design (Light)'
--config.color_scheme = 'Tokyo Night Light (Gogh)'
--config.color_scheme = 'tokyonight-day'
--config.color_scheme = 'Windows 10 Light (base16)'   -- workable
--config.color_scheme = 'Windows NT Light (base16)'  -- not horrible

config.color_scheme = 'Cupertino (base16)'  -- workable
--config.color_scheme = 'iceberg-light'   -- workable
--config.color_scheme = 'seoulbones_light'     -- Nice!
--config.color_scheme = 'Windows High Contrast Light (base16)'

config.colors = {
    foreground = 'black',
    background = 'grey80',

	tab_bar = {
		background = 'grey75',
		active_tab = {
			bg_color = 'grey80',
			fg_color = 'black',
			intensity = 'Bold',
		},
		inactive_tab = {
			bg_color = 'grey30',
			fg_color = 'grey85',
			intensity = 'Half',
		},
		new_tab = {
			bg_color = 'black',
			fg_color = 'grey85',
		},
	},

	scrollbar_thumb = 'grey50'

  --ansi = {
  --  'black',
  --  'maroon',
  --  'green',
  --  'olive',
  --  'navy',
  --  'purple',
  --  'teal',
  --  'silver',
  --},
  --brights = {
  --  'grey',
  --  'red',
  --  'lime',
  --  'yellow',
  --  'blue',
  --  'fuchsia',
  --  'aqua',
  --  'white',
  --},
}

config.window_frame = {
	font_size = 9.0,
	active_titlebar_bg = 'grey90',
	inactive_titlebar_bg = 'yellow',
}

-- config.window_background_opacity = 0.95

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.9,
}

config.enable_scroll_bar = true
config.use_fancy_tab_bar = true
config.adjust_window_size_when_changing_font_size = false

-- config.hyperlink_rules = { }
config.mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'NONE',
        action = act.CompleteSelection 'ClipboardAndPrimarySelection',
    },
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },
    -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
    {
      	event = { Down = { streak = 1, button = 'Left' } },
      	mods = 'CTRL',
      	action = act.Nop,
    },
}

config.initial_cols = 175
config.initial_rows = 50

config.launch_menu = {
	{
		label = 'Bedrock Main',
		args = { 'bash', '-l' },
		cwd = '/home/troth/work/bedrock/bedrock-main',
	},
	{
		label = 'Judo Main',
		args = { 'bash', '-l' },
		cwd = '/home/troth/work/judo/judo-main',
	},
}

config.keys = {
	{ key = '+', mods = 'SHIFT|ALT', action = act.ShowLauncher },
}

config.serial_ports = {
  {
    name = 'FT-9',
	port = '/dev/tty-ft-9',
    baud = 115200,
  },
}

config.scroll_to_bottom_on_input = true
config.scrollback_lines = 15000

config.swallow_mouse_click_on_pane_focus = true
config.swallow_mouse_click_on_window_focus = true
config.tab_and_split_indices_are_zero_based = true

config.font = wezterm.font('DejaVuSansMono', {})
config.font_size = 12.0

return config
