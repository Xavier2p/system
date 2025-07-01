# Apple related things, for macOS
{inputs, ...}: let
  user = "blaxxmith";
in {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ./homebrew.nix
    ./services.nix
    ./settings.nix
  ];

  nixpkgs.config.allowUnfree = true;

  users.users."${user}" = {
    home = "/Users/${user}";
  };

  home-manager = {
    # useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    useUserPackages = true;
    users."${user}" = import ./home.nix;
  };

  system.stateVersion = 6;
}
