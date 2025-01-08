{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./network.nix
    ../../nixos
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

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
    dns = false;
    expose = true;
    externalIp = "100.97.75.250";
  };

  services.openssh.enable = true;
  services.netbird.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = "24.05";
}
