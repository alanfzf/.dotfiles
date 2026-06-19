{ user, pkgs, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      playerctl
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
    nativeMessagingHosts.packages = [
      # pkgs.passff-host
    ];
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

  # services
  services.tumbler = {
    enable = true;
  };

  services.gvfs = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway";
        user = "${user}";
      };
    };
  };

  # portal
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings = {
        screencast = {
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
        };
      };
    };
    config = {
      common = {
        default = [ "wlr" ];
      };
    };
  };
}
