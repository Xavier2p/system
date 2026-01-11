{
  config,
  lib,
  ...
}: {
  sops.secrets.backdooris-wg = {
    mode = "0400";
    format = "binary";
    sopsFile = ../../secrets/backdooris.wg.sops;
  };

  networking = {
    hostName = "geonosis";

    interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
    interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

    hosts = {
      # Work
      # "10.1.1.14" = ["gitlab.alpes.si"];

      # Multi
      "10.102.0.61" = ["gestionnaire.si-dr.fr"];
      "10.101.0.51" = ["portal.si-dr.fr"];
      "10.101.0.61" = ["signal.si-dr.fr" "signal1.si-dr.fr" "signal2.si-dr.fr" "turn1.si-dr.fr" "turn2.si-dr.fr"];
      "10.100.4.81" = ["influx.si-dr.fr" "monitoring.si-dr.fr"];
      # "10.100.55.81" = ["influx.si-dr.fr" "monitoring.si-dr.fr"];

      # Tavel
      # "10.100.0.51" = ["portal.si-dr.fr" "signal.si-dr.fr" "signal1.si-dr.fr" "signal2.si-dr.fr" "turn1.si-dr.fr" "turn2.si-dr.fr"];
    };

    firewall = {
      enable = true;
    };

    wg-quick.interfaces = {
      backdooris.configFile = config.sops.secrets.backdooris-wg.path;
    };
  };
}
