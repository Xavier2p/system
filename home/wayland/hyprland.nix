{
  config,
  lib,
  ...
}: let
  cfg = config.hyprland;
in {
  options = {
    hyprland.enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        monitor = ",preferred,auto,1";

        general = {
          gaps_in = 3;
          gaps_out = 6;
          border_size = 1;
          #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.active_border" = "rgba(ff4d00ee)";
          "col.inactive_border" = "rgba(595959aa)";
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        "exec-once" = [
          "waybar"
          "hyprpaper"
          "[workspace 1 silent] alacritty"
          "[workspace 2 silent] firefox"
        ];

        "$mainMod" = "SUPER";
        "$terminal" = "alacritty";

        gestures = {
          workspace_swipe = false;
        };

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_options = "caps:swapescape";

          touchpad = {
            natural_scroll = true;
          };
        };

        decoration = {
          rounding = 16;

          active_opacity = 1.0;
          inactive_opacity = 1.0;

          #drop_shadow = true;
          #shadow_range = 4;
          #shadow_render_power = 3;
          #"col.shadow" = "rgba(1a1a1aee)";

          blur = {
            enabled = true;
            size = 3;
            passes = 1;

            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = true;

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        bind = [
          "$mainMod, Return, exec, $terminal"
          "$mainMod SHIFT, E, exec, wlogout"
          "$mainMod SHIFT, R, exec, hyprctl reload"
          "$mainMod SHIFT, Q, killactive"
          "$mainMod, Escape, exec, hyprlock"
          "Alt_L, space, exec, rofi -show drun -show-icons"

          ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
          ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"

          "$mainMod, L, movefocus, r"
          "$mainMod, H, movefocus, l"
          "$mainMod, J, movefocus, d"
          "$mainMod, K, movefocus, u"

          "$mainMod, Right, movefocus, r"
          "$mainMod, Left, movefocus, l"
          "$mainMod, Down, movefocus, d"
          "$mainMod, Up, movefocus, u"

          "$mainMod SHIFT, L, swapwindow, r"
          "$mainMod SHIFT, H, swapwindow, l"
          "$mainMod SHIFT, J, swapwindow, d"
          "$mainMod SHIFT, K, swapwindow, u"

          "$mainMod SHIFT, Right, swapwindow, r"
          "$mainMod SHIFT, Left, swapwindow, l"
          "$mainMod SHIFT, Down, swapwindow, d"
          "$mainMod SHIFT, Up, swapwindow, u"

          "$mainMod, f, fullscreen"

          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        ];
      };
    };
  };
}
