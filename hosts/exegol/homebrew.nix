{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    # App Store apps to install
    masApps = {
      # "Amphetamine" = "937984704";
    };
    # Homebrew casks to install
    casks = [
      "android-file-transfer"
      "appcleaner"
      "arc"
      "firefox"
      "insomnia"
      "maccy"
      "obsidian"
      "raycast"
      "vlc"
      # "burp-suite"
    ];
    # Homebrew taps to install
    taps = [ ];
    # Homebrew packages to install
    brews = [ ];
  };
}
