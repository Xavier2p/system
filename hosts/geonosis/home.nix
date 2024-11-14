{
  config,
  pkgs,
  ...
}: {
  imports = [./../../home];

  shelltools.enable = true;
  gui.enable = true;
  wayland.enable = true;
  nvim.enable = true;
}
