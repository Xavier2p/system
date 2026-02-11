{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.apple-t2
    ./hardware.nix
    ../../nixos
    ../generix/laptop.nix
    ../../profiles/work.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };

  networking.hostName = "coruscant";

  hardware.apple.touchBar.enable = true;

  system.stateVersion = "25.11";
}
