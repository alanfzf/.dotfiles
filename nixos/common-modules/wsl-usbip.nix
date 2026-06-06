{ pkgs, ... }:
{
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
}
