{ config, pkgs, ... }:
{
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    libreoffice
    playerctl
    # android development
    scrcpy
    android-studio
    android-tools
    # database
    jetbrains.datagrip
    mariadb.client
    bitwarden-desktop
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
