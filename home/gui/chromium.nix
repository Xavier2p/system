{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.chromium;
in {
  options.chromium.enable = lib.mkEnableOption "Enable Chromium Browser";

  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.chromium;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "gcknhkkoolaabfmlnjonogaaifnjlfnp" # FoxyProxy
        "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      ];
    };
  };
}
