{inputs, ...}: {
  imports = [
    inputs.home-man.nixosModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
