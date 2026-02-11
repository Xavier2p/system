{
  config,
  lib,
  ...
}: let
  cfg = config.forgeOS.services.traefik;
in {
  options.forgeOS.services.traefik = {
    enable = lib.mkEnableOption "Traefik, modern HTTP reverse proxy and load balancer";
  };

  config = lib.mkIf cfg.enable {
    services.traefik = {
      enable = true;
    };
  };
}
