{ inputs, ... }:
{

  imports = [
    ../../modules/platform/wsl.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  my.user = "alan";
  my.hostName = "wpc";
  my.davfs.enable = true;
}
