{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wayland;
in {
  imports = [
    ./hyprland.nix
    ./lockscreen.nix
    ./waybar.nix
    ./wlogout.nix
    ./theme.nix
    ./notifications.nix
    ./sway.nix
    ./keyboard.nix
  ];

  options = {
    wayland.enable = lib.mkEnableOption "Wayland Compositor";
  };

  config = lib.mkIf cfg.enable {
    hyprland.enable = lib.mkDefault false;
    hyprlock.enable = lib.mkDefault true;
    notifications.enable = lib.mkDefault true;
    theme.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
    wlogout.enable = lib.mkDefault true;
    sway.enable = lib.mkDefault true;

    home.packages = with pkgs; [
      waybar
      dunst
      wlogout
      rofi
      brightnessctl
    ];
  };
}
