{ config, pkgs, ... }:

{
  networking = {
    hostName = "geonosis";
    domain = "forge";

    enableIPv6 = false;

    # Enable networking
    networkmanager.enable = true;

    # Configure network proxy if necessary
    # proxy = {
    #     default = "http://user:password@proxy:port/";
    #     noProxy = "127.0.0.1,localhost,internal.domain";
    # };


  hosts = {
    "10.103.0.61" = [ "portal.si-dr.fr" ];
    "10.102.0.61" = ["signal.si-dr.fr" "signal1.si-dr.fr" "signal2.si-dr.fr" "turn1.si-dr.fr" "turn2.si-dr.fr"];
  };

    # Firewall.
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
      # allowedUDPPorts = [ ... ];
    };
  };
}
