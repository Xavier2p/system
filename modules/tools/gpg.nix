_: {
  flake.nixosModules.tools = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.forgeOS.tools.gpg;
  in {
    options.forgeOS.tools.gpg = {
      enable = lib.mkEnableOption "Sign and encrypt with GPG";
    };

    config = lib.mkIf cfg.enable {
      home-manager.sharedModules = [
        {
          home.packages = with pkgs; [
            yubikey-manager
            yubikey-personalization
          ];

          programs.gpg = {
            enable = true;
          };

          services.gpg-agent = {
            enable = true;
            enableSshSupport = false;
            defaultCacheTtl = 600;
            maxCacheTtl = 7200;
            pinentry.package = pkgs.pinentry-gnome3;
          };
        }
      ];
    };
  };
}
