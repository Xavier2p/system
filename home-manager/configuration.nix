{ pkgs, ... }: {
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    lsd
    neofetch
  ];

  home.sessionVariables = {
    DOTFILES = "~/.config/dotfiles";
    EDITOR = "vim";
  };

  programs.bat.enable = true;
  programs.zsh.enable = true;
  program.zsh.enableCompletions = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.shellAliases = {
    ls = "lsd";
    ll = "lsd -l";
    la = "lsd -A";
    lal = "lsd -lA";
    l = "lsd -l";
  };

  program.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
