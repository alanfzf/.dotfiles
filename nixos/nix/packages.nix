{ config, pkgs, ... }:
{
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    foot
    grim
    jetbrains.datagrip
    libnotify
    mako
    playerctl
    slurp
    swaybg
    waypaper
    wdisplays
    wl-clipboard
    scrcpy
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.thunar = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
    preferences = {
      "general.autoScroll" = true;
    };
  };

  programs.zsh = {
    enable = true;
  };
}
