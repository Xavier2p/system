{ lib, config, pkgs, ... }:

{
  # imports = [];

  options = {
    shelltools.enable = lib.mkEnableOption "Shell Tools Module";
  };

  config = lib.mkIf config.shelltools.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "Dracula";
        italic-text = "always";
      };
    };
  };
}
