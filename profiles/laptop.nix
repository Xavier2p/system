{
  lib,
  pkgs,
  ...
}: let
in {
  services = {
    libinput = {
      # Enable touchpad tap-to-click and natural scrolling
      enable = true;
      touchpad.naturalScrolling = true;
    };

    # Enable capabilities for mobile thethering
    # $ idevicepair pair
    usbmuxd.enable = true;

    # Enable printing
    printing.enable = lib.mkDefault false;

    # Enable SSH
    openssh.enable = lib.mkDefault false;
  };

  # Enable Sound
  services.pulseaudio.enable = lib.mkDefault false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = false;
    # If you want to use JACK applications, uncomment this
    jack.enable = false;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Install needed packages
  environment.systemPackages = with pkgs; [
    brightnessctl
    libimobiledevice
  ];

  # Enable Modules
  wm.enable = true;
}
