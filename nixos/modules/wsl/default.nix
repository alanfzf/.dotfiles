{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ../services
    ../system
    ../home-manager/home.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  config = {
    wsl = {
      enable = true;
      defaultUser = config.my.user;
      startMenuLaunchers = true;
    };

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
