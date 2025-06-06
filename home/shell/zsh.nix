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

      initContent = ''
        cd() {
        builtin cd "$@" && eza
        }
        if command -v kubectl >/dev/null 2>&1; then
          source <(kubectl completion zsh)
        fi
        if command -v helm >/dev/null 2>&1; then
          source <(helm completion zsh)
        fi
      '';

      history = {
        append = true;
        expireDuplicatesFirst = true;
        findNoDups = true;
        ignoreAllDups = true;
        ignoreDups = true;
        ignoreSpace = true;
        save = 1000;
        saveNoDups = true;
        share = false;
      };
    };
  };
}
