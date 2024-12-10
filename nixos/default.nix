{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./docker.nix
    ./networking.nix
    ./nix.nix
    ./wm.nix
    ./yubikey.nix
    ./services.nix
  ];

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  docker = {
    enable = lib.mkDefault true;
    dns = lib.mkDefault false;
    expose = lib.mkDefault false;
  };

  yubikey.enable = lib.mkDefault false;

  programs.nano.enable = false;

  documentation = {
    enable = true;
    # enable man, doc for packages and for home
  };

  wm.enable = lib.mkDefault false;

  environment.etc.issue.text = ''
         __________   ______   .______      _______  _______   ______        _______.
        /  /   ____| /  __  \\  |   _  \\    /  _____||   ____| /  __  \\      /       |
       /  /|  |__   |  |  |  | |  |_)  |  |  |  __  |  |__   |  |  |  |    |   (----`
      /  / |   __|  |  |  |  | |      /   |  | |_ | |   __|  |  |  |  |     \\   \\
     /  /  |  |     |  `--'  | |  |\\  \\--.|  |__| | |  |____ |  `--'  | .----)   |
    /__/   |__|      \\______/  | _| `.___| \\______| |_______| \\______/  |_______/

  '';
}
