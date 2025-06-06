{
  config,
  lib,
  ...
}: let
  cfg = config.iamb;
in {
  options = {
    iamb.enable = lib.mkEnableOption "IAMB Matrix Client";
  };

  config = lib.mkIf cfg.enable {
    programs.iamb = {
      enable = true;
      settings = {
        default_profile = "pki";
        profiles = {
          pki = {
            user_id = "@x:p.ki";
            url = "https://chat.p.ki";
          };
        };
      };
    };
  };
}
