{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;

    homeImports = import "${self}/home/profiles";

    mod = "${self}/system";

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    andromeda = nixosSystem {
      inherit specialArgs;
      modules = [
        ./andromeda # Host for IDEAPAD GAMING 3 15ACH6
        "${mod}/hardware/andromeda.nix" # Host Hardware and disk configuration
        "${mod}/main/hardware/graphics.nix" # graphics
        inputs.nixos-hardware.nixosModules.lenovo-ideapad-15ach6

        # Services

        "${mod}/main/services/audio.nix"
        "${mod}/main/services/power.nix"
        "${mod}/main/services/default.nix"
        "${mod}/main/services/gservices.nix"
        "${mod}/main/services/xserver.nix"

        # Programs

        "${mod}/programs"
        "${mod}/programs/fonts.nix"
        "${mod}/programs/games.nix"

        # Core

        "${mod}/main/core"
        "${mod}/main/core/boot.nix"

        "${mod}/desktop" # Desktops

        {
          home-manager = {
            users.user.imports = homeImports."user@andromeda";
            extraSpecialArgs = specialArgs;
            backupFileExtension = ".hm-backup";
          };
          #
        }

        inputs.agenix.nixosModules.default
        inputs.chaotic.nixosModules.default
      ];
    };
  };
}
