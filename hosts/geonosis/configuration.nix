# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-67770c13-d64e-4676-8e53-aba49a68d96a".device = "/dev/disk/by-uuid/67770c13-d64e-4676-8e53-aba49a68d96a";
  networking.hostName = "geonosis"; # Define your hostname.

  security.pki.certificateFiles = [ /home/eagle/Documents/carl/telex.crt ];

  networking.extraHosts = ''
    10.102.0.51 portal.si-dr.fr
    10.102.0.61 signal.si-dr.fr
    10.102.0.61 signal1.si-dr.fr
    10.102.0.61 signal2.si-dr.fr
    10.102.0.61 turn1.si-dr.fr
    10.102.0.61 turn2.si-dr.fr
  '';

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "eagle" = import ./home.nix;
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3;
      extraPackages = with pkgs; [
        i3status
        i3lock
        rofi
      ];
    };

    xkb = {
      layout = "us";
      variant = "";
      options = "caps:swapescape";
    };
  };

  services = {
    netbird.enable = true;
    fwupd.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable the OpenSSH daemon.
    openssh.enable = true;
  };

  services.displayManager = {
    defaultSession = "none+i3";
    ly = {
      enable = true;
      package = pkgs.ly;
      settings = {
        animation = "matrix";
      };
    };
  };


  # Enable sound with pipewire.
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

  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "gcknhkkoolaabfmlnjonogaaifnjlfnp" # FoxyProxy
    ];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eagle = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Xavier";
    extraGroups = [ "networkmanager" "wheel" "docker" "video"];
    packages = with pkgs; [
    #  thunderbird
    signal-desktop
    obsidian
  ];
};

  # Install firefox.
  programs.firefox.enable = true;
  programs.git.enable = true;

  programs.vim = {
    enable = true;
    package = pkgs.vim-full;
    defaultEditor = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim-full
    wget
    alacritty
    btop
    netbird
    docker
    starship
    zellij
    lsd
    nodejs
    clang_12
    clang-tools
    light
    chromium
  ];

  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "Hack" ]; }) ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  programs.zsh.enable = true;
}
