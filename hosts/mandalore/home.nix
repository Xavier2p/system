{
  imports = [../../home];

  home = {
    username = "sysadmin";
    homeDirectory = "/home/sysadmin";
  };

  shelltools.enable = true;
  gui.enable = false;
  wayland.enable = false;
  nvim.enable = true;
}
