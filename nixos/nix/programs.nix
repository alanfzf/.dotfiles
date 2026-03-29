{ config, pkgs, ... }:
{
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    libreoffice
    foot
    grim
    libnotify
    mako
    playerctl
    slurp
    swaybg
    waypaper
    wdisplays
    wl-clipboard
    # android development
    scrcpy
    android-studio
    android-tools
    # database
    jetbrains.datagrip
    mariadb.client
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

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };
      }
    ];
  };
}
