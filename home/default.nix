{
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    ./term
    ./services
    ./desktop
    ./programs
    ./wallpaper.nix
    self.nixosModules.theme
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "25.05";
    extraOutputsToInstall = ["doc" "devdoc"];
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;
}
