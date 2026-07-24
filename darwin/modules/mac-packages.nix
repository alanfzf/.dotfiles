{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.alacritty
    pkgs.jetbrains.datagrip
    pkgs.colima
    pkgs.docker
    pkgs.docker-compose
  ];
}
