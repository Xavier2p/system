{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings ={
      window = {
        decorations = "buttonless";
        dynamic_title = true;
        opacity = 0.91;
        startup_mode = "Windowed";
        title = "πK嘘@geonosis.forge"
        dimensions = {
          columns = 150;
          lines = 50;
        };
        padding = {
          x = 3;
          y = 3;
        };
      };
      cursor = {
        blink_interval = 750;
        style = {
          blinking ="Always";
          shape = "Underline";
        };
      };
    };
  };
}
