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
  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.05";
    file = {
      ".config/nixpkgs/config.nix".text = ''
        {
          allowUnfree = true;
          allowBroken = false;
        }
      '';
    };
  };
}
