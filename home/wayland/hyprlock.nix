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
            blur_passes = 2;
            brightness = 0.5;
            contrast = 1;
            vibrancy = 0.2;
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
            text = "Insert your physical token";
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
