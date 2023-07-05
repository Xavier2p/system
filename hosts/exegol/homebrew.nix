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
      "raycast"
      "maccy"
      "arc"
      "android-file-transfer"
      "appcleaner"
      # "burp-suite"
      "firefox"
      "obsidian"
    ];
    # Homebrew taps to install
    taps = [ ];
    # Homebrew packages to install
    brews = [ ];
  };
}
