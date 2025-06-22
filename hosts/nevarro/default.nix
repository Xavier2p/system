{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./network.nix
    ../../nixos
    ../../services
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sdb";
    useOSProber = true;
  };

  users.users.sysadmin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "System Administrator";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.sysadmin = import ./home.nix;
  };

  docker = {
    enable = true;
    dns = true;
    dnsServer = "10.0.0.50";
    expose = true;
    externalIp = "10.0.0.60";
  };

  services.openssh.enable = true;
  services.netbird.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = "23.05";

  forgeServices = {
    enable = false;
    homassist = false;
  };
}
