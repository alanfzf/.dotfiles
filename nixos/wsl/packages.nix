{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ ];
    };
  };
}
