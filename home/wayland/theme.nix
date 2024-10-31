{ config, lib, pkgs, ... }:

let
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

    services.hyprpaper = {
      enable = true;
      settings = {
        preload =["${wallpaper}"];
        wallpaper = [", ${wallpaper}"];
      };
    };
  };
}
