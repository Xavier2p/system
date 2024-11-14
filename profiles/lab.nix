{
  config,
  lib,
  pkgs,
  ...
}: let
  externalIp = "enter here the external IP of the machine";
  dockerDnsServer = "enter here the DNS server for Docker";
in {
  docker = {
    enable = true;
    expose = true;
    externalIp = externalIp;
    dns = true;
    dnsServer = dockerDnsServer;
  };
}
