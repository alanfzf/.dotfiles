{
  config,
  pkgs,
  user,
  ...
}:
{

  services = {
    gvfs = {
      enable = true;
    };

    tumbler = {
      enable = true;
    };

    gnome = {
      gnome-keyring.enable = true;
      gcr-ssh-agent.enable = false;
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.sway}/bin/sway";
          user = "${user}";
        };
      };
    };

    pipewire = {
      enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    config = {
      common = {
        default = [ "wlr" ];
      };
    };
  };
}
