{
  config,
  lib,
  ...
}: let
  cfg = config.wm;
in {
  options = {
    wm.enable = lib.mkEnableOption "Graphical environment";
  };

  config = lib.mkIf cfg.enable {
    environment.sessionVariables = {NIXOS_OZONE_WL = "1";};

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = lib.mkForce false;
      wlr.enable = true;
      xdgOpenUsePortal = true;
    };

    hardware = {
      graphics.enable = true;
      nvidia.modesetting.enable = true;
    };
  };
}
