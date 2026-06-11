{ inputs, ... }:
{

  imports = [
    ../../common-modules/docker.nix
    ../../common-modules/gc.nix
    ../../common-modules/home.nix
    ../../common-modules/locale.nix
    ../../common-modules/programs.nix
    ../../common-modules/users.nix
    ../../common-modules/wsl-usbip.nix
    ../../common-modules/wsl.nix
    ../../common-modules/davfs2.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  networking.hostName = "wpc";
  system.stateVersion = "25.11";
}
