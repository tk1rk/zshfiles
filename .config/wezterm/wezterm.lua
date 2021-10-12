local wezterm = require 'wezterm';

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
  exit_behavior = "NeverPrompt",
  color_scheme = "Flat",
  default_prog = {
    "/usr/local/bin/zsh", "-l"
  },
  bold_brightens_ansi_colors = true,
  ssh_domains = {
    {
      name = "RPI",
      remote_address = "192.168.2.5",
      username = "pi",
    }
  },

  font_dirs = {
    "$HOME/.config/wezterm/fonts/"
  },

  font_rules = {
    {
      italic = false,
      bold = false,
      font = wezterm.font_with_fallback({"MesloLGS NF"},{foreground=""}),
    },
    {
      italic = true,
      bold = false,
      font = wezterm.font_with_fallback("MesloLGS NF"),{foreground=""}), 
    },
    {
      italic = false,
      bold = true,
      font = wezterm.font_with_fallback("MesloLGS NF"),{foreground=""}),
    },
    {
      italic = true,
      bold = true,
      font = wezterm.font_with_fallback("MesloLGS NF"),{foreground=""}),
    },
  },
  front_end = "OpenGL",
  font_size = 12.0,
  font_shaper = "Harfbuzz",
  harfbuzz_features = {"kern", "liga", "clig", "calt"},
  font_antialias = "Subpixel",
  font_hinting = "Full",
  line_height = 1.0,
  freetype_load_target = "HorizontalLcd",
  freetype_render_target = "Light",
  default_cursor_style = "SteadyUnderline",,
  tab_bar_at_bottom = true,
    tab_bar_style = {
    active_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    active_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
    inactive_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    inactive_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
  },
  term = "wezterm",
  window_decorations = "NONE",
  -- Flat
  color_scheme = {
    foreground = "#2cc55d"
    background = "#002240"
    cursor_bg = "#e5be0c"
    cursor_border = "#e5be0c"
    cursor_fg = "#ffffff"
    selection_bg = "#792b9c"
    selection_fg = "#ffffff"
    ansi = ["#222d3f","#a82320","#32a548","#e58d11","#3167ac","#781aa0","#2c9370","#b0b6ba"]
    brights = ["#212c3c","#d4312e","#2d9440","#e5be0c","#3c7dd2","#8230a7","#35b387","#e7eced"]
  tab_bar = {
    background = "#002240",
    active_tab = {bg_color = "#002240", fg_color = "#2cc55d", italic = true},
    inactive_tab = {bg_color = "#1d1e24", fg_color = "#2cc55d"},
    inactive_tab_hover = {bg_color = "#1d1e24", fg_color = "#2cc55d"},
  }
}
