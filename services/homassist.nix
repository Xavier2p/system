{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.forgeServices.homassist;
in {
  options.forgeServices.homassist = {
    enable = lib.mkEnableOption "Enable Home Assistant";
  };

  config = lib.mkIf cfg.enable {
    services.home-assistant = {
      enable = true;
      openFirewall = true;
    };
  };
}
