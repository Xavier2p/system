{
  imports = [./../../home];

  home = {
    username = "eagle";
    homeDirectory = "/home/eagle";
  };

  shelltools.enable = true;
  gui.enable = true;
  wayland.enable = true;
  nvim.enable = true;
  iamb.enable = true;
}
