{ ... }:

{
  system = {

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Automatic";
        AppleShowAllFiles = true;
      };

      dock = {
        autohide = false;
        show-recents = false;
      };
    };
  };

  keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  fonts = {
    fontDir.enable = true;
    fonts = [
      (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
    ];
  };
}
