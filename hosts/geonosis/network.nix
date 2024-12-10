{pkgs, ...}: {
  networking = {
    hostName = "geonosis";

    # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

    hosts = {
      "10.103.0.61" = ["portal.si-dr.fr"];
      "10.102.0.61" = ["signal.si-dr.fr" "signal1.si-dr.fr" "signal2.si-dr.fr" "turn1.si-dr.fr" "turn2.si-dr.fr"];
    };

    # Firewall.
    firewall = {
      allowedTCPPorts = [22];
      # allowedUDPPorts = [ ... ];
    };
  };
  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "root";
    permissions = "u+rx,g+x,o+x";
  };
}
