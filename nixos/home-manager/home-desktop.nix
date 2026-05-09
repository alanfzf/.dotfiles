{ config, pkgs, ... }:
let
  isWSL = builtins.pathExists "/proc/sys/fs/binfmt_misc/WSLInterop";
in
{
  gtk = {
    enable = !isWSL;
    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis";
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk4 = {
      theme = config.gtk.theme;
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
