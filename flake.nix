{
  description = "`/forgeOS`: Infrastructure as Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    darwin,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    vars = import ./vars.nix;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      geonosis = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/geonosis
          inputs.home-manager.nixosModules.default
        ];
      };
      nevarro = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nevarro
          inputs.home-manager.nixosModules.default
        ];
      };
      mandalore = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/mandalore
          inputs.home-manager.nixosModules.default
        ];
      };
    };
    darwinConfigurations.kamino = darwin.lib.darwinSystem {
      specialArgs = {inherit inputs;};
      system = "aarch64-darwin";
      pkgs = import nixpkgs {system = "aarch64-darwin";};
      modules = [
        ./hosts/kamino
        inputs.home-manager.darwinModules.home-manager
      ];
    };
  };
}
