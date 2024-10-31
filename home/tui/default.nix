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
    ./shell-tools.nix
    ./zellij.nix
  ];

  options = {
    tui.enable = lib.mkEnableOption "Enable TUI programs";
  };

  config = lib.mkIf cfg.enable {
    git.enable = lib.mkDefault true;
    nvim.enable = lib.mkDefault false;
    shelltools.enable = lib.mkDefault true;
    zellij.enable = lib.mkDefault true;
  };
}
