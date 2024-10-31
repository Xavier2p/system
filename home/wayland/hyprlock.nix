{ config, lib, pkgs, ... }:

let cfg = config.hyprlock;
in {
  options = {
    hyprlock.enable = lib.mkEnableOption "Hyprlock";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;

      settings = {
        general = {
          disable_loading_bar = false;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            monitor = "";
            path = "/home/eagle/Documents/assets/wallpaper.jpg";
          }
        ];
#         input-field = [
#           {
#             monitor = "eDP-1";
# 
#             size = "300, 50";
# 
#             outline_thickness = 1;
# 
#         #outer_color = "rgb(${c.primary})";
#           #inner_color = "rgb(${c.on_primary_container})";
#           #font_color = "rgb(${c.primary_container})";
# 
#           fade_on_empty = false;
#           placeholder_text = ''<i>Enter Password</i>'';
# 
#           dots_spacing = 0.2;
#           dots_center = true;
#         }
#       ];

      label = [
        {
          monitor = "";
          text = "$TIME";
         #  inherit font_family;
         font_size = 50;
          # color = "rgb(${c.primary})";

          position = "0, 150";

          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:3600000] date +'%a %b %d'";
          #inherit font_family;
          font_size = 20;
          #color = "rgb(${c.primary})";

          position = "0, 50";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
};
}
