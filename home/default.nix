{
  config,
  lib,
  pkgs,
  ...
}: {
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
}
