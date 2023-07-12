{ pkgs, ... }:

{
  home.stateVersion = "23.05";
  home.enableNixpkgsReleaseCheck = false;

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

  programs.bat.enable = true;

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
