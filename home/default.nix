{lib, ...}: let
  username = "eagle";
in {
  imports = [
    ./gui
    ./shell
    ./tui
    ./wayland
  ];

  gui.enable = lib.mkDefault false;
  shell.enable = lib.mkDefault true;
  tui.enable = lib.mkDefault true;
  wayland.enable = lib.mkDefault false;

  home.username = username;
  home.homeDirectory = "/home/${username}";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  home.packages = [
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # ".screenrc".source = dotfiles/screenrc;

    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
