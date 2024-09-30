{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Xavier";
    userEmail = "xavier.de-place@epita.fr";

    lfs.enable = true;

    extraConfig = {
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/gh-sign.pub";
      init.defaultBranch = "master";
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
      ".direnv/"
    ];

    aliases = {
      csm = "commit -S -m";
      cm = "commit -m";
      ls = "ls-files";
      t = "tag -ma";
    };
  };
}
