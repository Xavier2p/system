# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./network.nix
    inputs.home-manager.nixosModules.default
    ../../nixos
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-67770c13-d64e-4676-8e53-aba49a68d96a".device = "/dev/disk/by-uuid/67770c13-d64e-4676-8e53-aba49a68d96a";

  # to move to work profile
  security.pki.certificateFiles = [/home/eagle/Documents/carl/telex.crt];

  # in each host file
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Variabilize the user name and add to template host file
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "eagle" = import ./home.nix;
    };
  };

  # to move to the docker file
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  # to move to the wm file
  # Enable the X11 windowing system.
  # services.xserver = {
  #   enable = false;

  #   windowManager.i3 = {
  #     enable = true;
  #     package = pkgs.i3;
  #     extraPackages = with pkgs; [
  #       i3status
  #       i3lock
  #       rofi
  #     ];
  #   };

  #   xkb = {
  #     layout = "us";
  #     variant = "";
  #     options = "caps:swapescape";
  #   };
  # };

  services.displayManager = {
    ly = {
      enable = true;
      package = pkgs.ly;
      settings = {
        animation = "matrix";
      };
    };
  };

  # to move to the services file
  services = {
    netbird.enable = true;
    fwupd.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable the OpenSSH daemon.
    openssh.enable = true;
    usbmuxd.enable = true;
  };

  # to move to the sound file
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # to move to the chromium file, with home-manager
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "gcknhkkoolaabfmlnjonogaaifnjlfnp" # FoxyProxy
    ];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  security.pam = {
    u2f = {
      enable = true;
      settings.cue = true;
      control = "sufficient";
    };
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      ly.u2fAuth = true;
      i3lock.u2fAuth = true;
      hyprlock.u2fAuth = true;
    };
  };

  # to move to the users file
  users.users.eagle = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Xavier";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      # Move this packages to the home-manager config
      signal-desktop
      obsidian
    ];
  };

  # Static config for Firefox in its own file
  programs.firefox.enable = true;

  # Test if this settings is really necessary (servise already enabled)
  programs.git.enable = true;

  # Verify if this settings are system wide and move it to its own file
  programs.vim = {
    enable = true;
    package = pkgs.vim-full;
    defaultEditor = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };
  # Create a config for nix in os/ and add this configuration to it
  nixpkgs.config.allowUnfree = true;

  # Remove all unwanted system wide packages and move them to the home-manager config
  environment.systemPackages = with pkgs; [
    vim-full
    wget
    netbird
    docker
    nodejs
    clang_12
    clang-tools
    brightnessctl
    chromium
    libimobiledevice
  ];

  # move this line to the home-manager config
  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["Hack"];})];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # check if this line is mandatory
  programs.zsh.enable = true;
}
