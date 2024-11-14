{
  config,
  lib,
  pkgs,
  ...
}: {
  services = {
    # Enable Netbird Peer-to-Peer VPN
    netbird.enable = true;
    # Enable firmware updates
    fwupd.enable = true;
  };
}
