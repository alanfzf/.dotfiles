{ ... }:
{
  imports = [
    ../common.nix
    ../network.nix
  ];

  networking.hostName = "corpo";
  system.stateVersion = "24.05";
}
