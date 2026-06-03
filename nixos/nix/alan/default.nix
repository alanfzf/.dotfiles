{ ... }:
{
  imports = [
    ../common.nix
    ../network.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";
  system.stateVersion = "24.05";
}
