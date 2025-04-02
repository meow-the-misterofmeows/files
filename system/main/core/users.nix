{
  flake,
  pkgs,
  config,
  ...
}: {
  users = {
    mutableUsers = false;
    users = {
      root.password = "a";
      user = {
        isNormalUser = true;
        password = "a";
        shell = pkgs.zsh;

        extraGroups = [
          "wheel"
          "systemd-journal"
          "vboxusers"
          "audio"
          "plugdev"
          "wireshark"
          "video"
          "input"
          "lp"
          "networkmanager"
          "power"
          "nix"
          "adbusers"
        ];
        uid = 1000;
      };
    };
  };

  security = {
    sudo = {
      enable = true;
      extraRules = [
        {
          commands =
            builtins.map (command: {
              command = "/run/current-system/sw/bin/${command}";
              options = ["NOPASSWD"];
            })
            ["poweroff" "reboot" "nixos-rebuild" "nix-env" "bandwhich" "systemctl"];
          groups = ["wheel"];
        }
      ];
    };

  };
}
