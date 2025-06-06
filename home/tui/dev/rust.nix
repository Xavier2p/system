{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.rust;
in {
  options = {
    rust.enable = lib.mkEnableOption "Enable Rust development environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [cargo rustc];
  };
}
