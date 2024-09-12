{ pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./zsh.nix
    ./git.nix
    ./vscode.nix
  ];
}
