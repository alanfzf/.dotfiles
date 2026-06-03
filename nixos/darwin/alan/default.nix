{ ... }:
{
  imports = [
    ../common.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 5;
}
