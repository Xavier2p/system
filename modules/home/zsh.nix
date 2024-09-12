{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = import ./zsh-aliases.nix;
    enableCompletion = true;
    localVariables = { };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = false;
  };
}
