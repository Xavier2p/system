{
  description = "`/forgeOS`: Infrastructure as Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # darwin = {
    #   url = "github:lnl7/nix-darwin";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
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
          inputs.stylix.nixosModules.stylix
        ];
      };
      nevarro = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nevarro
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ];
      };
      mandalore = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/mandalore
          #inputs.home-manager.nixosModules.default
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
