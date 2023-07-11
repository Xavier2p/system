{ pkgs, ... }:

{
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    # lsd
    # neofetch
    # ansible
    # git
    # vim
    # btop
    # gh

    # # Fun
    # asciiquarium
    # cmatrix
    cbonsai
    # lolcat
    # sl
    # toilet
  ];

  home.sessionVariables = {
    DOTFILES = "~/.config/dotfiles";
    EDITOR = "vim";
    NIX_TEST_VAR = "test";
  };

  # programs.zsh = {
  #   enable = true;
  #   enableCompletions = true;
  #   enableSyntaxHighlighting = true;
  #   shellAliases = {
  #     ls = "lsd";
  #     ll = "lsd -l";
  #     la = "lsd -A";
  #     lal = "lsd -lA";
  #     l = "lsd -l";
  #   };
  # };
}
