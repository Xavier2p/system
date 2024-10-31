{ config, lib, pkgs, ... }:


let cfg = config.gui;
in {
  imports = [
    ./alacritty.nix
    ./i3status.nix
    ./vscode.nix
  ];

  options = {
    gui.enable = lib.mkEnableOption "Desktop GUI Apps";
  };

  config = lib.mkIf cfg.enable {
    alacritty.enable = lib.mkDefault true;
    i3status.enable = lib.mkDefault true;
    vscode.enable = lib.mkDefault true;
  };
}
