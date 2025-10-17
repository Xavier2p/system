{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wayland;
in {
  imports = [
    ./bars.nix
    ./theme.nix
    ./notifications.nix
    ./keyboard.nix
  ];

  options.wayland = {
    enable = lib.mkEnableOption "Wayland Compositor";
    enableLock = lib.mkOption {
      type = lib.types.bool;
      default = cfg.enable;
      description = "Enable lock screen functionality";
    };
  };

  config = lib.mkIf cfg.enable {
    bars.enable = lib.mkDefault cfg.enable;
    notifications.enable = lib.mkDefault cfg.enable;
    theme.enable = lib.mkDefault cfg.enable;

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
      };
    };

    programs.swaylock = {
      enable = cfg.enableLock;
      settings.image = "/home/eagle/Documents/assets/wallpaper.jpg";
    };

    home.packages = with pkgs; [
      rofi
      brightnessctl
      wl-clipboard-rs
      wdisplays
    ];
  };
}
