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

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  users.users.sysadmin = {
    isNormalUser = true;
    description = "System Administrator";
    extraGroups = ["networkmanager" "wheel"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.sysadmin = import ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  services.openssh.enable = true;
  services.netbird.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}
