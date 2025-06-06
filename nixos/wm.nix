{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.wm;
in {
  options = {
    wm.enable = lib.mkEnableOption "Graphical environment";
  };

  config = lib.mkIf cfg.enable {
    # services.xserver = {
    #   enable = false;

    #   windowManager.i3 = {
    #     enable = true;
    #     package = pkgs.i3;
    #     extraPackages = with pkgs; [
    #       i3status
    #       i3lock
    #       rofi
    #     ];
    #   };

    #   xkb = {
    #     layout = "us";
    #     variant = "";
    #     options = "caps:swapescape";
    #   };
    # };

    services.displayManager = {
      ly = {
        enable = true;
        package = pkgs.ly;
        settings = {
          animation = "matrix";
        };
      };
    };

    environment.sessionVariables = {NIXOS_OZONE_WL = "1";};
    programs.hyprland = {
      enable = false;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
    };

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      # extraPortals = [
      #   pkgs.xdg-desktop-portal-wlr
      # ];
    };

    hardware = {
      graphics.enable = true;
      nvidia.modesetting.enable = true;
    };
  };
}
