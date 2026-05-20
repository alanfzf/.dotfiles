{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    mariadb.client
  ];

  programs.zsh = {
    enable = true;
  };
}
