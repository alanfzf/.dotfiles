{ config, pkgs, ... }:
{
  options = {

  };

  config = {
    environment.localBinInPath = true;
    environment.systemPackages = with pkgs; [
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
  };
}
