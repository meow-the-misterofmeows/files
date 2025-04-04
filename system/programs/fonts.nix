{pkgs, ...}: let
  inherit (builtins) attrValues;
in {
  environment.sessionVariables.FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  fonts = {
    packages =
      attrValues {
        inherit
          (pkgs)
          material-icons
          material-design-icons
          roboto
          work-sans
          comic-neue
          source-sans
          twemoji-color-font
          comfortaa
          inter
          lato
          lexend
          jost
          dejavu_fonts
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-emoji
          ;
      }
      ++ [
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.nerd-fonts.iosevka
        pkgs.nerd-fonts.proggy-clean-tt
        # (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
      ];

    enableDefaultPackages = false;

    # this fixes emoji stuff
    fontconfig = {
      defaultFonts = {
        monospace = [
          #"JetBrainsMono"
          "ProggyClean Nerd Font"
          "Noto Color Emoji"
        ];
        sansSerif = ["ProggyClean Nerd Font" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
