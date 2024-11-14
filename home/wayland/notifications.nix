{
  config,
  lib,
  ...
}: let
  cfg = config.notifications;
in {
  options = {
    notifications.enable = lib.mkEnableOption "Notifications Daemon";
  };

  config = lib.mkIf cfg.enable {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          follow = "keyboard";
          width = 370;
          separator_height = 1;
          padding = 10;
          horizontal_padding = 10;
          frame_width = 1;
          sort = "update";
          idle_threshold = 120;
          alignment = "center";
          word_wrap = "yes";
          transparency = 5;
          format = "<b>%s</b>: %b";
          markup = "full";
          min_icon_size = 32;
          max_icon_size = 128;
          # highlight = mkForce base03;
        };
      };
    };
  };
}
