{pkgs, ...}: let
  user = "eagle";
in {
  programs.git = {
    userName = "Xavier de Place";
    userEmail = "xavier.de-place@epita.fr";
  };

  users.users."${user}" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "System Administrator";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  home-manager = {
    users."${user}" = {
      imports = [./../home];

      home = {
        username = user;
        homeDirectory = "/home/${user}";
      };

      forgeOS.desktop.enable = true;
      forgeOS.tools.enable = true;
      nvim.enable = true;
    };
  };
}
