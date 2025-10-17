{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.gui;
in {
  imports = [
    ./alacritty.nix
    ./chromium.nix
    ./vscode.nix
  ];

  options = {
    gui.enable = lib.mkEnableOption "Desktop GUI Apps";
  };

  config = lib.mkIf cfg.enable {
    alacritty.enable = lib.mkDefault true;
    chromium.enable = lib.mkDefault true;
    vscode.enable = lib.mkDefault false;

    home.packages = with pkgs; [
      signal-desktop
      obsidian
      feh
    ];
  };
}
