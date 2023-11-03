{ pkgs, ... }:

{
  program.zsh = {
    enable = true;
    autocd = true;
    aliases = import ../config/aliases.nix;
    enableCompletions = true;
    enableSyntaxHighlighting = true;
    localVariables = { };
  };
}
