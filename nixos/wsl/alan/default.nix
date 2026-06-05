{
  config,
  lib,
  pkgs,
  user,
  inputs,
  ...
}:
{

  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  system.stateVersion = "25.05";
}
