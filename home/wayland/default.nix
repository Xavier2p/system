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
    ./hyprlock.nix
    ./waybar.nix
    ./wlogout.nix
    ./theme.nix
    ./notifications.nix
  ];

  options = {
    wayland.enable = lib.mkEnableOption "Wayland Compositor";
  };

  config = lib.mkIf cfg.enable {
    hyprland.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    notifications.enable = lib.mkDefault true;
    theme.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
    wlogout.enable = lib.mkDefault true;

    home.packages = with pkgs; [
      hyprlock
      hypridle
      hyprpaper
      waybar
      dunst
      wlogout
      rofi
      brightnessctl
      # qt6-wayland
      # qt5-wayland
    ];
  };
}
