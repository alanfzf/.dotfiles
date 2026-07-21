{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/window-manager/sway.nix
  ];

  my.user = "alan";
  my.hostName = "corpo";
  my.vpn.enable = true;
}
