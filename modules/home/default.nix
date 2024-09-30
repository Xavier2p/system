{ pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./zsh.nix
    ./git.nix
    ./vscode.nix
    ./i3status.nix
  ];
}
