{ pkgs, ... }: {
  imports = [
    ./starship.nix
    ./zsh.nix
  ];
}