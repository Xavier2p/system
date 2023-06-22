{
  description = "Xavier2p Forge System Configuration";

  inputs = {
    # Nix channels
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # NixOS modules for macOS
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager modules
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { home-manager, darwin, nixpkgs-unstable, nixpkgs-stable, nixpkgs, ...} : {
    darwinConfiguration.exegol = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs { system = "aarch64-darwin"; };
      modules = [
        ./darwin/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUsersPackages = true;
            users."xavier2p" = {
              imports = [
                ./home-manager/configuration.nix
              ];
            };
          };
        }
      ];
    };
  };
}
