{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.forgeOS.tools.fastfetch;
in {
  options.forgeOS.tools.fastfetch = {
    enable = lib.mkEnableOption "Fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      package = pkgs.fastfetch;
    };
  };
}
