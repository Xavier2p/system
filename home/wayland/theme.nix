{
  config,
  lib,
  ...
}: let
  cfg = config.theme;
  wallpaper = "/home/eagle/Documents/assets/wallpaper.jpg";
in {
  options = {
    theme.enable = lib.mkEnableOption "Theme Configuration";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=1
    '';

    home.file.".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=1
    '';

    wayland.windowManager.sway.config = {
      startup = [
        {
          command = "swaymsg output '*' bg /home/eagle/Documents/assets/wallpaper.jpg fill";
          always = true;
        }
      ];
      colors = {
        background = "#000000";
        focused = {
          border = "#ff4d00";
          childBorder = "#ff4d00";
          background = "#ff4d00";
          indicator = "#ff4d00";
          text = "#ff4d00";
        };
        unfocused = {
          border = "#595959";
          childBorder = "#595959";
          background = "#595959";
          indicator = "#595959";
          text = "#595959";
        };
        urgent = {
          border = "#ff0000";
          childBorder = "#ff0000";
          background = "#ff0000";
          indicator = "#ff0000";
          text = "#ff0000";
        };
      };
      gaps = {
        inner = 6;
        outer = 3;
        top = 2;
      };
      window = {
        border = 1;
        titlebar = false;
      };
    };
  };
}
