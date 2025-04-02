{
  pkgs,
  lib,
  ...
}: let
  gtk-theme = "gruvbox-dark";

  cursor-theme = "Bibata-Modern-Classic";
  cursor-package = pkgs.bibata-cursors;
in {
  home = {
    packages = with pkgs; [
      # themes
      adwaita-qt6
      adw-gtk3
      material-symbols
      bibata-cursors
      gruvbox-dark-gtk
      # morewaita-icon-theme
      # papirus-icon-theme
      # qogir-icon-theme
      # whitesur-icon-theme
      # colloid-icon-theme
      # qogir-theme
      # yaru-theme
      # whitesur-gtk-theme
      # orchis-theme
    ];
  };

  gtk = {
    enable = true;
    font.name = "ProggyClean nerd font";
    theme.name = gtk-theme;
    cursorTheme = {
      name = cursor-theme;
      package = cursor-package;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  dconf.settings."org/gtk/settings/file-chooser" = {
    sort-directories-first = true;
  };

  # GTK4 Setup
  dconf.settings."org/gnome/desktop/interface" = {
    gtk-theme = lib.mkForce "gruvbox-dark";
    color-scheme = "prefer-dark";
  };
}
