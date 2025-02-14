{lib, ...}: {
  imports = [
    ./gui
    ./shell
    ./tui
    ./wayland
  ];

  gui.enable = lib.mkDefault false;
  shell.enable = lib.mkDefault true;
  tui.enable = lib.mkDefault true;
  wayland.enable = lib.mkDefault false;

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  home.packages = [];

  home.file = {
    ".config/nixpkgs/config.nix".text = ''
      {
        allowUnfree = true;
        allowBroken = false;
      }
    '';
  };

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
