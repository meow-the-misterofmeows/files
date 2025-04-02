{config, ...}: let
  cursorName = "Bibata-Modern-Classic";
in {
  programs.hyprland.settings = {
    "$mod" = "SUPER";
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "HYPRCURSOR_THEME,${cursorName}"
      "HYPRCURSOR_SIZE,${toString 24}"
    ];

    exec-once = [
      "uswm-finalize"
      "hyprctl setcursor ${cursorName} ${toString 24}"
    ];

    monitor = [
      "HDMI-A-1,1920x1080@100,0x0,1"
      "eDP-1,disable"
      #      "eDP-1,1920x1080@144,0x0,1"
    ];

    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 3;
      "col.active_border" = "rgba(85990088)";
      "col.inactive_border" = "rgba(07364288)";

      allow_tearing = false;
      resize_on_border = true;
    };

    decoration = {
      rounding = 0;
      rounding_power = 3;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.01;

        vibrancy = 0.2;
        vibrancy_darkness = 0.5;

        passes = 4;
        size = 7;

        popups = true;
        popups_ignorealpha = 0.2;
      };

      shadow = {
        enabled = false;
        color = "rgba(00000055)";
        ignore_window = true;
        offset = "0 15";
        range = 100;
        render_power = 2;
        scale = 0.97;
      };
    };

    animations.enabled = true;

    animation = [
      "border, 1, 2, default"
      "fade, 1, 2, default"
      "windows, 1, 2, default, popin 85%"
      "workspaces, 1, 2, default, slidevert"
    ];

    group = {
      groupbar = {
        font_size = 10;
        gradients = false;
        text_color = "rgb(b6c4ff)";
      };

      "col.border_active" = "rgba(35447988)";
      "col.border_inactive" = "rgba(dce1ff88)";
    };

    input = {
      kb_layout = "us";

      follow_mouse = 1;
      accel_profile = "flat";
      tablet.output = "current";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;

      animate_mouse_windowdragging = false;

      vrr = 1;
    };

    render = {
      direct_scanout = true;
    };
    gestures = {
      workspace_swipe_forever = true;
    };

    xwayland.force_zero_scaling = true;

    debug.disable_logs = false;

    /*
      plugin = {
      hyprbars = {
        bar_height = 30;
        bar_precedence_over_border = true;
        bar_color = "rgba(3c3836FF)";
      };
    };
    */
  };
}
