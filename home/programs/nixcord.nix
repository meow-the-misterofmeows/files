{
  pkgs,
  inputs,
  ...
}: {

  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    config = {
      useQuickCss = false; 
      themeLinks = [ 
        #"https://refact0r.github.io/system24/theme/flavors/gruvbox-material.theme.css"
        "https://raw.githubusercontent.com/meow-the-misterofmeows/discord-themeing/refs/heads/main/a.css"
      ];
      frameless = true; 
      plugins = {
        hideAttachments.enable = true;
        blurNSFW.enable = true;
        plainFolderIcon.enable = true;
        experiments.enable = true;
      };
    };

  };

}
