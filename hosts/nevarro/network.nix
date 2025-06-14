{
  networking = {
    hostName = "nevarro";

    defaultGateway = {
      address = "10.0.0.1";
      interface = "enp2s0";
    };

    interfaces.enp2s0 = {
      ipv4.addresses = [
        {
          address = "10.0.0.60";
          prefixLength = 24;
        }
      ];
      useDHCP = false;
      wakeOnLan = {
        enable = true;
        policy = ["magic"];
      };
    };

    hosts = {};

    nameservers = ["10.0.0.50"];

    firewall = {
      allowedTCPPorts = [22 80 443 2375];
    };
  };
}
