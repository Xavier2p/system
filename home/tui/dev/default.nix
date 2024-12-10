{
  config,
  lib,
  ...
}: let
  cfg = config.dev;
in {
  imports = [
    ./rust.nix
  ];
  options = {
    dev.enable = lib.mkEnableOption "Enable development environment";
  };

  config = lib.mkIf cfg.enable {
    rust.enable = lib.mkDefault true;
  };
}
