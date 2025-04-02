{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./editor
    ./emulator/wezterm.nix
  ];

  programs.btop = {
    enable = true;
    package = pkgs.btop.override {
      rocmSupport = true;
      cudaSupport = true;
    };
    settings = {
      vim_keys = true;
      rounded_corners = false;
      proc_tree = true;
      show_gpu_info = "on";
      show_uptime = true;
      show_coretemp = true;
      cpu_sensor = "auto";
      show_disks = true;
      only_physical = true;
      io_mode = true;
      io_graph_combined = false;
    };
  };

  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      format = ''
        $directory$character
      '';

      character = {
        success_symbol = "[ 󰘧](bold blue)";
        error_symbol = "[ 󰘧](bold blue)";
      };

      nix_shell = {
        symbol = " ";
        heuristic = true;
      };
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      code = "$HOME/dev";
      dots = "$HOME/dev/config";
      pics = "$HOME/Pictures";
      vids = "$HOME/Videos";
      #nixpkgs = "$HOME/Documents/code/git/nixpkgs";
    };
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    shellAliases = {
      g = "git";
      grep = "grep --color";
      ip = "ip --color";
      l = "eza -l";
      la = "eza -la";
      md = "mkdir -p";
      ppc = "powerprofilesctl";
      pf = "powerprofilesctl launch -p performance";

      us = "systemctl --user"; # mnemonic for user systemctl
      rs = "sudo systemctl"; # mnemonic for root systemctl
    };
  };
}
