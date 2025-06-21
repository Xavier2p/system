{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.forgeServices;
  integrations = [
    "adguard"
    "default_config"
    "homekit_controller"
    "homekit"
    "ios"
    "mealie"
    "meteo_france"
    "mobile_app"
    "unifi"
    "unifiprotect"
  ];
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
          time_zone = "Europe/Paris";
          temperature_unit = "C";
        };
        lovelace.mode = "yaml";
        http = {
          server_port = 8123;
          server_host = [
            "0.0.0.0"
            "::"
          ];
        };
      };

      defaultIntegrations = integrations;
      extraComponents = integrations;
    };

    environment.systemPackages = with pkgs.python310Packages; [
      pyatv
      pymetno
      gtts
      radios
    ];
  };
}
