{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pinentry-curses
    # below are optionals
    mariadb.client
    bruno
    obs-studio
    libreoffice
    # android development
    android-studio
    android-tools
    # database
    jetbrains.datagrip
    rustdesk-flutter
  ];
}
