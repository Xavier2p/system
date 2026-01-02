{
  lib,
  config,
  ...
}: {
  options.shelltools.enable = lib.mkEnableOption "Shell Tools Module";

  config = lib.mkIf config.shelltools.enable {
    programs = {
      yazi = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
