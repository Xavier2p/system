{
  lib,
  config,
  pkgs,
  ...
}:
# this file must be splitted in one file per program
{
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

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
      enableZshIntegration = true;
    };

    programs.gh = {
      enable = true;
      extensions = with pkgs; [gh-copilot];
      settings = {
        git_protocol = "ssh";
      };
    };

    programs.btop.enable = true;
    programs.lsd.enable = true;

    #    programs.vim = {
    #enable = true;
    #      defaultEditor = false;
    #};
  };
}
