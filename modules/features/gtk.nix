{
  flake.nixosModules.gtk =
    {
      pkgs,
      lib,
      ...
    }:
    let
      theme-name = "Adwaita-dark";
      theme-package = pkgs.gnome-themes-extra;
      icon-theme-package = pkgs.adwaita-icon-theme;
      icon-theme-name = "Adwaita";

      gtksettings = ''
        [Settings]
        gtk-icon-theme-name = ${icon-theme-name}
        gtk-theme-name = ${theme-name}
        gtk-application-prefer-dark-theme=true
      '';
    in
    {
      environment = {
        etc = {
          "xdg/gtk-3.0/settings.ini".text = gtksettings;
          "xdg/gtk-4.0/settings.ini".text = gtksettings;
        };
      };

      environment.variables = {
        GTK_THEME = theme-name;
      };

      programs.dconf = {
        enable = true;
        profiles.user.databases = [
          {
            settings = {
              "org/gnome/desktop/interface" = {
                gtk-theme = theme-name;
                icon-theme = icon-theme-name;
                color-scheme = "prefer-dark";
              };
            };
          }
        ];
      };

      environment.systemPackages = [
        theme-package
        icon-theme-package
        pkgs.gtk3
        pkgs.gtk4
      ];
    };
}
