{
  config,
  lib,
  ...
}: let
  cfg = config.hyprlock;
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
