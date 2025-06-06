{pkgs, ...}: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    # Homebrew casks to install
    casks = [
      "android-file-transfer"
      "appcleaner"
      "arc"
      "insomnia"
      "obsidian"
      "raycast"
      "vlc"
    ];
    # Homebrew taps to install
    taps = [];
    # Homebrew packages to install
    brews = [];
  };
}
