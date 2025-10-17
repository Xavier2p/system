{
  config,
  lib,
  ...
}: let
  cfg = config.yubikey;
in {
  options.yubikey = {
    enable = lib.mkEnableOption "Enable Yubikey for PAM";
    waylandEnable = lib.mkEnableOption "Enable Yubikey for Wayland";
  };

  config = lib.mkIf cfg.enable {
    security.pam = {
      u2f = {
        enable = true;
        settings.cue = true;
        control = "sufficient";
      };
      services = {
        login.u2fAuth = true;
        sudo.u2fAuth = true;
        swaylock.u2fAuth = lib.mkIf cfg.waylandEnable true;
      };
    };
  };
}
