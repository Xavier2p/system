{ pkgs, ... }: {
  program.zsh = {
    enable = true;
    enableCompletions = true;
    enableSyntaxHighlighting = true;
  }
}