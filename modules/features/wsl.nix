{
  flake.nixosModules.wsl = { pkgs, config, ... }: {
    # inputs.nixos-wsl.nixosModules.default
    wsl.enable = true;
    wsl.defaultUser = config.preferences.user.name;
    wsl.startMenuLaunchers = true;
    wsl.usbip = {
      enable = true;
      autoAttach = [ ];
    };

    services.udev = {
      enable = true;
      packages = [ pkgs.yubikey-personalization ];
      extraRules = ''
        SUBSYSTEM=="usb", MODE="0666"
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", TAG+="uaccess", MODE="0666"
      '';
    };

    programs.fuse = {
      enable = true;
      userAllowOther = true;
    };
  };
}
