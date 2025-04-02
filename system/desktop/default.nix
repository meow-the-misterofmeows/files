{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.nixosModules.default
    inputs.stylix.nixosModules.stylix

    ./hypr
  ];

  environment = {
    pathsToLink = ["/share/icons"];
    systemPackages = [
      inputs.self.packages.${pkgs.system}.bibata
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      pkgs.sddm-astronaut
      pkgs.eww
    ];
    variables.NIXOS_OZONE_WL = "1";
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

      plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
        # hyprbars
      ];
    };
  };
}
