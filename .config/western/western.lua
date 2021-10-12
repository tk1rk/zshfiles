local wezterm = require 'wezterm';


return {
  exit_behavior = "Hold",
  color_scheme = "Batman",
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
      font = wezterm.font("MesloLGS NF"),
    },
    {
      italic = true,
      bold = false,
      font = wezterm.font("MesloLGS NF"),
    },
    {
      italic = false,
      bold = true,
      font = wezterm.font("MesloLGS NF"),
    },
    {
      italic = true,
      bold = true,
      font = wezterm.font(MesloLGS NF"),
    },
  },
