{
  lib,
  pkgs,
  ...
}: let
  modifier = "Mod4";
in {
  wayland.windowManager.sway.config = {
    modifier = modifier;

    input = {
      "type:keyboard" = {
        xkb_layout = "us";
        xkb_options = "caps:escape";
      };
      "type:touchpad" = {
        natural_scroll = "enabled";
      };
    };

    keybindings = {
      # General
      "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
      "${modifier}+Shift+e" = "exec ${pkgs.wlogout}/bin/wlogout";
      "${modifier}+Shift+r" = "reload";
      "${modifier}+Shift+q" = "kill";
      "${modifier}+Escape" = "exec ${pkgs.swaylock}/bin/swaylock";
      "Mod1+space" = "exec ${pkgs.rofi}/bin/rofi -show drun -show-icons";
      "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";
      "XF86MonBrightnessUp" = "exec brightnessctl set 10%+";
      "Shift+XF86MonBrightnessDown" = "exec brightnessctl -d 'tpacpi::kbd_backlight' set 0";
      "Shift+XF86MonBrightnessUp" = "exec brightnessctl -d 'tpacpi::kbd_backlight' set 2";
      "${modifier}+r" = "mode resize";
      # Focus next window
      "${modifier}+l" = "focus right";
      "${modifier}+h" = "focus left";
      "${modifier}+j" = "focus down";
      "${modifier}+k" = "focus up";
      "${modifier}+Right" = "focus right";
      "${modifier}+Left" = "focus left";
      "${modifier}+Down" = "focus down";
      "${modifier}+Up" = "focus up";
      # Swap windows
      "${modifier}+Shift+l" = "move right";
      "${modifier}+Shift+h" = "move left";
      "${modifier}+Shift+j" = "move down";
      "${modifier}+Shift+k" = "move up";
      "${modifier}+Shift+Right" = "move right";
      "${modifier}+Shift+Left" = "move left";
      "${modifier}+Shift+Down" = "move down";
      "${modifier}+Shift+Up" = "move up";
      # Focus the selected workspace
      "${modifier}+1" = "workspace number 1";
      "${modifier}+2" = "workspace number 2";
      "${modifier}+3" = "workspace number 3";
      "${modifier}+4" = "workspace number 4";
      "${modifier}+5" = "workspace number 5";
      "${modifier}+6" = "workspace number 6";
      "${modifier}+7" = "workspace number 7";
      "${modifier}+8" = "workspace number 8";
      "${modifier}+9" = "workspace number 9";
      "${modifier}+0" = "workspace number 10";
      # Move container to selected workspace
      "${modifier}+Shift+1" = "move container to workspace number 1";
      "${modifier}+Shift+2" = "move container to workspace number 2";
      "${modifier}+Shift+3" = "move container to workspace number 3";
      "${modifier}+Shift+4" = "move container to workspace number 4";
      "${modifier}+Shift+5" = "move container to workspace number 5";
      "${modifier}+Shift+6" = "move container to workspace number 6";
      "${modifier}+Shift+7" = "move container to workspace number 7";
      "${modifier}+Shift+8" = "move container to workspace number 8";
      "${modifier}+Shift+9" = "move container to workspace number 9";
      "${modifier}+Shift+0" = "move container to workspace number 10";
    };
  };
}
