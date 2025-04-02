{pkgs, inputs, ...}: {
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };

    steam = {
      enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];

      gamescopeSession.enable = true;
    };
  };
    environment = {
      systemPackages = [
        #inputs.fjordlauncher.packages.${pkgs.system}.fjordlauncher
      ];
    };
}