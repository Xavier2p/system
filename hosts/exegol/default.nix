# Apple related things, for macOS
{pkgs, inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ./homebrew.nix
    ./settings.nix
  ];
  # programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
  # services.nix-daemon.enable = true;

  users.users.xavier2p = {
    home = "/Users/xavier2p";
  };

  home-manager = {
    # useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    useUserPackages = true;
    users.xavier2p = import ./home.nix;
  };

  system.stateVersion = 6;
}
