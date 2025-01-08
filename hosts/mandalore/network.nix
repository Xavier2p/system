{
  networking = {
    hostName = "mandalore";
    networkmanager.enable = false;

    # interfaces.ens18.useDHCP = lib.mkDefault true;
    firewall = {
      allowedTCPPorts = [22 80 443 2375];
    };
  };
}
