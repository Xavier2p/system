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
  };

  config = lib.mkIf cfg.enable {
    homassist.enable = lib.mkDefault false;
  };
}
