{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    package = pkgs.zellij;
    settings = {
      mouse_mode = true;
    };
  };
}
