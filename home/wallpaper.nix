{
  theme = {
    wallpaper = let
      url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/f99638d8d1a11d97a99ff7e0e1e7df58c28643ff/wallpapers/nix-wallpaper-nineish-solarized-light.png";
      sha256 = "gb5s5ePdw7kuIL3SI8VVhOcLcHu0cHMJJ623vg1kz40=";
      ext = "png";
    in
      builtins.fetchurl {
        name = "wallpaper-${sha256}.${ext}";
        inherit url sha256;
      };
  };
}
