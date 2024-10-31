{ config, lib, pkgs, ... }:

let
  cfg = config.shell;
in {
  imports = [
    ./aliases.nix
    # ./plugins.nix
    ./starship.nix
    ./zsh.nix
  ];

  options = {
    shell.enable = lib.mkEnableOption true;
  };

  config = lib.mkIf cfg.enable {
    aliases.enable = lib.mkDefault true;
    # plugins = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
  };
}
