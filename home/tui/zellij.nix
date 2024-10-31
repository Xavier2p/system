{ config, lib, pkgs, ... }:

let
  cfg = config.zellij;
in {
  options = {
    zellij.enable = lib.mkEnableOption "Zellij terminal multiplexer";
  };

  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableZshIntegration = false;
      package = pkgs.zellij;
      settings = {
        mouse_mode = true;
        ui = {
          pane_frames = {
            rounded_corners = true;
          };
        };
      };
    };
  };
}
