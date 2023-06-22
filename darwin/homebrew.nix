{ pkgs, ... }: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    # App Store apps to install
    masApps = { "Amphetamine" };
    # Homebrew casks to install
    casks = [ "raycast" "maccy" ];
    # Homebrew taps to install
    taps = [];
    # Homebrew packages to install
    brews = [];
  }
}
