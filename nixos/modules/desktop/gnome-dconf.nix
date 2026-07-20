{ lib, config, ... }:
{
  config = {
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
  };
}
