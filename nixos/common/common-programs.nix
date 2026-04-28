{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    bitwarden-cli
  ];
  programs.zsh = {
    enable = true;
  };
}
