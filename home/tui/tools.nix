{
  lib,
  config,
  ...
}: {
  options.shelltools.enable = lib.mkEnableOption "Shell Tools Module";

  config = lib.mkIf config.shelltools.enable {
    programs = {
      bat = {
        enable = true;
        config = {
          theme = "Dracula";
          italic-text = "always";
        };
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;
        silent = true;
        enableZshIntegration = true;
      };

      btop.enable = true;

      fd = {
        enable = true;
        hidden = true;
      };

      eza = {
        enable = true;
        git = true;
        icons = "always";
        colors = "always";
        enableZshIntegration = true;
        extraOptions = ["--sort=type"];
      };

      ripgrep = {
        enable = true;
        arguments = [];
      };

      skim = {
        enable = true;
        enableZshIntegration = true;
        defaultOptions = ["--ansi" "--height 1" "--reverse"];
        historyWidgetOptions = ["--ansi" "--height 1" "--prompt h>"];
      };

      yazi = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
