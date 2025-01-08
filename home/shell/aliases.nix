{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.aliases;
  ls = "lsd";
  editor = "nvim";
in {
  options = {
    aliases.enable = lib.mkEnableOption true;
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.shellAliases = {
      ls = "${ls}";
      la = "${ls} --almost-all";
      l = "${ls} --long --git --human-readable --almost-all";
      ll = "${ls} --long --human-readable";
      lll = "${ls} --almost-all --long --human-readable";
      tree = "${ls} --tree";

      g = "git";
      gb = "git branch";
      gl = "git log --all --oneline --graph --decorate";
      gp = "git pull; git log --all --oneline --graph --decorate -n 10";
      gpsh = "git push";

      mk = "${editor} Makefile";
      rca = "${editor} ~/.system/home/shell/aliases.nix";

      dk = "docker";
      dkc = "docker-compose";
      kb = "kubectl";
      tf = "terraform";
      make = "make -Bj";
      z = "zellij";
      v = "${editor}";

      cpl = "gcc -Wextra -Wall -Werror -Wvla -std=c99 -pedantic -g -o out *.c";

      ":q" = "exit";
    };
  };
}
