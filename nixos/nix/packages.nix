{ config, pkgs, ... }:
{
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    libreoffice
    mariadb
    chromium
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
    dbeaver-bin
    # android development
    scrcpy
    android-studio
    android-tools
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
    package = pkgs.firefox-devedition;
    preferences = {
      "general.autoScroll" = true;
    };
  };

  programs.zsh = {
    enable = true;
  };
}
