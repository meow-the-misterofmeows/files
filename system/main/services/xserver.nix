{pkgs, ...}:{
  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.gnome = {
        enable = false;
        extraGSettingsOverridePackages = [
          pkgs.nautilus-open-any-terminal
        ];
      };
    };
  };
}
