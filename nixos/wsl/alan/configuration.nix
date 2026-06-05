{ ... }:
{

  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  networking.hostName = "wpc";
  system.stateVersion = "25.11";
}
