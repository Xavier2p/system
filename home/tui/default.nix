{
  config,
  lib,
  ...
}: let
  cfg = config.tui;
in {
  imports = [
    ./git.nix
    ./neovim
    ./dev
    ./iamb.nix
    ./tools.nix
    ./zellij.nix
  ];

  options = {
    tui.enable = lib.mkEnableOption "Enable TUI programs";
  };

  config = lib.mkIf cfg.enable {
    git.enable = lib.mkDefault true;
    nvim.enable = lib.mkDefault true;
    shelltools.enable = lib.mkDefault true;
    zellij.enable = lib.mkDefault true;
    dev.enable = lib.mkDefault false;
    iamb.enable = lib.mkDefault false;
  };
}
