{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Xavier";
    userEmail = "xavier.de-place@epita.fr";

    extraConfig = {
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/gh-sign.pub";
    };

    ignores = [
      "__pycache__/"
      ".DS_Store"
      ".env"
      "*.exe"
      ".idea/"
      ".vscode/"
      "*.d"
      "*.local"
      "*.o"
      "*.swp"
      "dist/"
      "node_modules/"
      "secrets/"
      "target/"
      "*.out"
    ];
    aliases = {
      csm = "commit -S -m";
      cm = "commit -m";
      ls = "ls-files";
      t = "tag -ma";
    };
  };
}
