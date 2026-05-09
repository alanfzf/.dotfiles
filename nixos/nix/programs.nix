{ config, pkgs, ... }:
{
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    obs-studio
    libreoffice
    playerctl
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
    extraPackages = with pkgs; [
      brightnessctl
      foot
      grim
      libnotify
      mako
      slurp
      swaybg
      swaylock
      waypaper
      wdisplays
      wl-clipboard
      ristretto
    ];
  };

  programs.thunar = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
    # package = pkgs.firefox-devedition;
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
            gtk-theme = "Orchis";
            icon-theme = "Tela";
          };
        };
      }
    ];
  };
}
