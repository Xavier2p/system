{
  config,
  lib,
  ...
}: let
  cfg = config.zsh;
in {
  options = {
    zsh.enable = lib.mkEnableOption "ZSH shell";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autocd = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = false;
      enableCompletion = true;
      historySubstringSearch.enable = true;

      initExtra = ''
        cd() {
        builtin cd "$@" && lsd
        }
      '';

      history = {
        expireDuplicatesFirst = true;
        save = 1000;
      };
    };
  };
}
