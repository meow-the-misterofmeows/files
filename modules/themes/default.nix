{lib, ...}: {
  options.theme = {
    name = lib.mkOption {
      description = ''
        time
      '';
      type = lib.types.str;
      example = lib.literalExample "gruvbox";
      default = "dark";
    };

    wallpaper = lib.mkOption {
      description = ''
        Location of the wallpaper to use throughout the system.
      '';
      type = lib.types.path;
      example = lib.literalExample "./wallpaper.png";
    };
  };
}