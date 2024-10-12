{ config, lib, pkgs, ... }:


let cfg = config.desktop;
in {
  imports = [
    ./alacritty.nix
    ./i3status.nix
    ./vscode.nix
  ];

  options = {
    desktop.enable = lib.mkEnableOption "Desktop Module";
  };

  config = lib.mkIf cfg.enable {
    alacritty.enable = lib.mkDefault true;
    i3status.enable = lib.mkDefault true;
    vscode.enable = lib.mkDefault true;
  };
}
