{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.aliases;
in {
  options = {
    aliases.enable = lib.mkEnableOption true;
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.shellAliases = {
      ls = "lsd";
      la = "lsd --almost-all";
      l = "lsd --long --git --human-readable --almost-all";
      ll = "lsd --long --human-readable";
      lll = "lsd --almost-all --long --human-readable";
      tree = "lsd --tree";

      g = "git";
      gb = "git branch";
      gl = "git log --all --oneline --graph --decorate";
      gp = "git pull; git log --all --oneline --graph --decorate -n 10";
      gpsh = "git push";

      mk = "nvim Makefile";
      rca = "nvim ~/.system/home/shell/aliases.nix";

      dk = "docker";
      dkc = "docker-compose";
      kb = "kubectl";
      tf = "terraform";
      make = "make -Bj";
      z = "zellij";
      v = "nvim";

      cpl = "gcc -Wextra -Wall -Werror -Wvla -std=c99 -pedantic -g -o out *.c";

      ":q" = "exit";
    };
  };
}
