{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    ignores = [
      "__pycache__/"
      ".DS_Store"
      ".env"
      ".exe"
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
    ];
    aliases = {
      csm = "commit -S -m";
      cm = "commit -m";
      ls = "ls-files";
    };
  };
}
