{
  description = "Xavier2p `/forge` System Configuration";

  inputs = {
    # Nix channels
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # NixOS modules for macOS
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager modules
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { home-manager, darwin, nixpkgs, ... }:
    {
      darwinConfiguration."exegol" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        modules = [
          # ./hosts/exegol/configuration.nix
          ({ pkgs, ... }: {
            # system.stateVersion = "4";
            systemPackages = with pkgs; [ sl ];
            programs.bat.enable = true;
          })
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."xavier2p" = {
                imports = [
                  ./home/configuration.nix
                ];
              };
            };
          }
        ];
      };
    };
}
