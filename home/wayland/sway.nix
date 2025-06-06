{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sway;
in {
  options = {
    sway.enable = lib.mkEnableOption "Sway WM";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      systemd.enable = true;
      wrapperFeatures.gtk = true;
      checkConfig = true;
      config = {
        defaultWorkspace = "workspace number 1";
        output = {
          "eDP-1" = {
            mode = "1920x1200@60.002Hz";
          };
        };

        startup = [
          # {
          #   command = "systemctl --user restart waybar";
          #   always = true;
          # }
          {
            command = "swaymsg output '*' bg /home/eagle/Documents/assets/wallpaper.jpg fill";
            always = true;
          }
        ];

        bars = [];
      };
    };
  };
}
