{
  config,
  lib,
  ...
}: let
  cfg = config.aliases;
  ls = "eza";
  editor = "nvim";
in {
  options = {
    aliases.enable = lib.mkEnableOption true;
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.shellAliases = {
      ls = "${ls}";
      la = "${ls} --almost-all";
      l = "${ls} --long --almost-all --octal-permissions --header";
      ll = "${ls} --long --header";
      tree = "${ls} --tree";

      g = "git";

      mk = "${editor} Makefile";
      rca = "${editor} ~/.system/home/shell/aliases.nix";

      dk = "docker";
      dkc = "docker-compose";
      k = "kubectl";
      kn = "kubectl config set-context minikube --namespace";
      tf = "terraform";
      ai = "ansible-inventory";
      ap = "ansible-playbook";
      nb = "netbird";
      make = "make -Bj";
      v = "${editor}";

      # Oxydize
      cat = "bat";
      ncdu = "dua i";
      grep = "rg";
      find = "fd";
      fzf = "sk";
      du = "dust";

      # Oneliners
      pskill = "ps aux | sk | awk '{print $2}' | xargs -r kill";

      ":q" = "exit";
    };
  };
}
