{
  inputs,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "left";
        modules-right = ["tray" "clock"];
        modules-left = ["custom/anyrun"];
        modules-center = ["hyprland/workspaces"];
        width = 40;
        #margin-bottom = 4;
        #margin-top = 4;
        #margin-left = 4;

        "custom/anyrun" = {
          tooltip = false;
          format = "";
          on-click = "anyrun";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = "";
            default = "·";
          };
          sort-by-number = true;
        };

        clock.format = "{:%H\n%M}";

        "tray" = {
          icon-size = 18;
          spacing = 5;
        };
      }
    ];
    style = ''
      *{
      	all: unset;
      }

      window#waybar{
       font-family: "ProggyClean Nerd Font";
       margin: 12px 12px 12px 0px;
       border-right: 3px solid #859900;
       background-color: #fdf6e3;
      }

      #workspaces button.active{
       font-family: 'ProggyClean Nerd Font* 12 Medium';
        padding-right: 6px;
       font-size: 14px;
       color: #073642;
      }

      #clock{
       font-family: "ProggyClean Nerd Font";
       font-size: 17px;
       margin: 15px;
       color: #073642;
       padding: 15px 10px;
       margin: 0px;
       background: rgba(0,0,0,0);
      }

      #workspaces {
       padding: 10px 10px;
       margin: 0px;
       border-radius: 2px;
       background-color: rgba(0,0,0, 0);
       color: #073642;
      }

      #tray,
      #tray {
       padding: 0px 0px 0px 0px;
      }

      #custom-anyrun {
        color: #073642;
        padding-top: 10px;
      }

    '';
  };
}
