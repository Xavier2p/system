{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5791a5ef-3ecc-449f-98dc-98d672bfe081";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-8a251ab2-bf62-4df6-9d91-cbf207e66be9".device = "/dev/disk/by-uuid/8a251ab2-bf62-4df6-9d91-cbf207e66be9";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/975C-C611";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/c91d5e66-9910-4900-aa88-de5560a13e54";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
