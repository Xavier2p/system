{
  description = "`/forgeOS`: Infrastructure as Nix";

  inputs = {
    # Nix channels
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # NixOS modules for macOS
    # darwin = {
    #   url = "github:lnl7/nix-darwin";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Home Manager modules
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    vars = import ./vars.nix;
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      geonosis = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/geonosis
          inputs.home-manager.nixosModules.default
        ];
      };
    };
      # darwinConfiguration."exegol" = darwin.lib.darwinSystem {
      #   system = "aarch64-darwin";
      #   pkgs = import nixpkgs { system = "aarch64-darwin"; };
      #   modules = [
      #     # ./hosts/exegol/configuration.nix
      #     ({ pkgs, ... }: {
      #       # system.stateVersion = "4";
      #       systemPackages = with pkgs; [ sl ];
      #       programs.bat.enable = true;
      #     })
      #     home-manager.darwinModules.home-manager
      #     {
      #       home-manager = {
      #         useGlobalPkgs = true;
      #         useUserPackages = true;
      #         users."xavier2p" = {
      #           imports = [
      #             ./home/configuration.nix
      #           ];
      #         };
      #       };
      #     }
      #   ];
      # };
    };
  }
