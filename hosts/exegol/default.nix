# Apple related things, for macOS
{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ./homebrew.nix
    ./settings.nix
  ];

  nixpkgs.config.allowUnfree = true;

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
