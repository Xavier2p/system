{
  config,
  lib,
  ...
}: {
  imports = [
    ./traefik.nix

    ./mealie.nix
  ];

  options.forgeOS.services = {
    enable = lib.mkEnableOption "/forgeOS services";
  };

  config = lib.mkIf config.forgeOS.services.enable {
    forgeOS.services = {
      traefik = {
        enable = true;
      };
    };
  };
}
