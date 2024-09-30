{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = import ./zsh-aliases.nix;
    initExtra = ''
      cd() {
        builtin cd "$@" && lsd
      }
      source $HOME/.config/dotfiles/plugins/codestats.plugin.zsh
    '';
    enableCompletion = true;
    localVariables = {
      CODESTATS_API_KEY = "SFMyNTY.V0dGMmFXVnlNbkE9IyNNak0zTVRJPQ.a5GhCOWzL9pePvh7CUGF79nGGvd5FuBgvnneSpwECTQ";
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = false;
  };
}
