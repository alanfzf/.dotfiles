{
  flake.nixosModules.gnome = { ... }: {
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

    services.gnome = {
      gnome-keyring.enable = true;
      gcr-ssh-agent.enable = false;
    };
  };
}
