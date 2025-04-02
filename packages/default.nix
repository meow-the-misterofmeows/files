{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      bibata = pkgs.callPackage ./bibata {};
    };
  };
}
