{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rofi
    bibata-cursors
    nwg-look
    gruvbox-gtk-theme
    git
    #rmpc
    #mpd
    termusic
    qutebrowser
    cava
    tty-clock
    inputs.fetch.packages.${pkgs.system}.fetch
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
