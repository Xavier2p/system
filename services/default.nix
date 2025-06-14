{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.forgeServices;
in {
  imports = [
    ./homassist.nix
  ];

  options.forgeServices = {
    enable = lib.mkEnableOption "Enable the /forge Service Store";
    homassist = lib.mkEnableOption "Enable Home Assistant";
  };

  config = lib.mkIf cfg.enable {
    homassist.enable = cfg.homassist;
  };
}
