{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.forgeServices;
in {
  imports = [];

  options.forgeServices = {
    enable = lib.mkEnableOption "Enable the /forge Service Store";
    homassist = lib.mkEnableOption "Enable Home Assistant";
  };

  config = lib.mkIf cfg.enable {
    services.home-assistant = {
      enable = cfg.homassist;
      openFirewall = true;
      configWritable = true;

      config = {
        homeassistant = {
          name = "ThePlaceToLive";
          unit_system = "metric";
        };
      };
    };
  };
}
