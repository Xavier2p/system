_: {
  flake.nixosModules.desktop = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.forgeOS.desktop.keyring;
  in {
    options.forgeOS.desktop.keyring = {
      enable = lib.mkEnableOption "Keyring using Gnome Keyring";
    };

    config = {
      security.pam.services.login.enableGnomeKeyring = true;
      services.gnome.gnome-keyring.enable = true;
      environment = {
        sessionVariables.PROTON_PASS_LINUX_KEYRING = "dbus";
        systemPackages = [pkgs.proton-pass-cli];
      };

      home-manager.sharedModules = lib.mkIf cfg.enable [
        {
          services.gnome-keyring = {
            enable = true;
            components = ["secrets"];
          };
        }
      ];
    };
  };
}
