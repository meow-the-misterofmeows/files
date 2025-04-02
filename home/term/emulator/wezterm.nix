{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require "wezterm"
      return {
        check_for_updates = false,
        color_scheme = 'Solarized (light) (terminal.sexy)',
        default_cursor_style = 'SteadyBar',
        enable_scroll_bar = false,
        font_size = 13,
        font = wezterm.font 'ProggyClean Nerd Font',
        hide_tab_bar_if_only_one_tab = true,
        scrollback_lines = 10000,
        window_background_opacity = 1.0,
      }
    '';
  };
}
