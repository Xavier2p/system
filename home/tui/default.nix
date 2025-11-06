{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.tui;
in {
  imports = [
    ./git.nix
    ./neovim
    ./iamb.nix
    ./tools.nix
    ./zellij.nix
  ];

  options.tui.enable = lib.mkEnableOption "Enable TUI programs";

  config = lib.mkIf cfg.enable {
    git.enable = lib.mkDefault true;
    nvim.enable = lib.mkDefault true;
    shelltools.enable = lib.mkDefault true;
    zellij.enable = lib.mkDefault true;
    iamb.enable = lib.mkDefault false;

    home.packages = with pkgs; [
      wget
      dua
      dust
      presenterm
      exegol
    ];
  };
}
