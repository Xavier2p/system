{ config, lib, pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./zsh.nix
    ./git.nix
    ./zellij.nix
    ./shell-tools.nix
    ./desktop/default.nix
  ];

  desktop.enable = lib.mkDefault false;
}
