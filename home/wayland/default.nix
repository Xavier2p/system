{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wayland;
in {
  imports = [
    ./lock.nix
    ./bars.nix
    ./theme.nix
    ./notifications.nix
    ./keyboard.nix
  ];

  options = {
    wayland.enable = lib.mkEnableOption "Wayland Compositor";
  };

  config = lib.mkIf cfg.enable {
    lock.enable = lib.mkDefault true;
    notifications.enable = lib.mkDefault true;
    theme.enable = lib.mkDefault true;
    bars.enable = lib.mkDefault true;

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

    home.packages = with pkgs; [
      rofi
      brightnessctl
    ];
  };
}
