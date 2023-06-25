# Apple related things, for macOS

{ pkgs, ... }:

{
  imports = [
    ./homebrew.nix
    ./defaults.nix
  ];
  programs.zsh.enable = true;
}
