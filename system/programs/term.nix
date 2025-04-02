{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
  ];

  # zsh config

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        #suedit = "sudo nvim";
        #edit = "nvim";
        c = "clear";
        rebuild = "nh os switch";
        ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        #cat = "bat";
        #man = "batman";
        #ls = "eza --icons --group-directories-first -1";
        #ll = "eza --icons -lh --group-directories-first -1 --no-user --long";
        #la = "eza --icons -lah --group-directories-first -1";
        #tree = "eza --icons --tree --group-directories-first";
      };
    };
    yazi = {
      enable = true;
    };
  };
}
