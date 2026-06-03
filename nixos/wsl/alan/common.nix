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
    # common
    ../common/common-home.nix
    ../common/common-programs.nix
    ../common/common-services.nix
    ../common/common-users.nix
  ];
}
