{pkgs, ...}: {
  environment.systemPackages = [pkgs.nvfetcher];
  nix = {
    gc.automatic = false;

    package = pkgs.lix;

    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";

    settings = {
      flake-registry = "/etc/nix/registry.json";
      auto-optimise-store = true;
      builders-use-substitutes = true;
      allowed-users = ["@wheel"];
      trusted-users = ["@wheel"];
      commit-lockfile-summary = "chore: Update flake.lock";
      accept-flake-config = true;
      keep-derivations = true;
      keep-outputs = true;
      warn-dirty = false;

      sandbox = true;
      max-jobs = "auto";
      keep-going = true;
      log-lines = 20;
      extra-experimental-features = ["flakes" "nix-command"];

      substituters = [
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
        "https://anyrun.cachix.org"
        "https://unmojang.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY="
      ];
    };
  };

  programs.nix-ld.enable = true;
  programs.nh = {
    enable = true;
    flake = "/home/user/files";
  };

  systemd.services.nix-daemon = {
    environment.TMPDIR = "/var/tmp";
  };

  system.switch = {
    enable = false;
    enableNg = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true; #for nvidia shit
      allowBroken = true;
    };
  };
}
