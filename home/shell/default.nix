{
  config,
  lib,
  ...
}: let
  cfg = config.shell;
in {
  imports = [
    ./aliases.nix
    ./starship.nix
    ./zsh.nix
  ];

  options = {
    shell.enable = lib.mkEnableOption true;
  };

  config = lib.mkIf cfg.enable {
    aliases.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
  };
}
