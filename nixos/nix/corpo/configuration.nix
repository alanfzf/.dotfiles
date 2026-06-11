{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../common-modules/users.nix
    ../../common-modules/sway.nix
    ../../common-modules/pipewire.nix
    ../../common-modules/packages.nix
    ../../common-modules/programs.nix
    ../../common-modules/network.nix
    ../../common-modules/locale.nix
    ../../common-modules/home.nix
    ../../common-modules/gnome-keyring.nix
    ../../common-modules/gc.nix
    ../../common-modules/docker.nix
    ../../common-modules/bootloader.nix
    ../../common-modules/bluetooth.nix
    ../../common-modules/davfs2.nix
  ];

  networking.hostName = "corpo";
  system.stateVersion = "25.11";
}
