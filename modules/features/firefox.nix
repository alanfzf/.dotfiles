{
  flake.nixosModules.firefox = { ... }: {
    programs.firefox = {
      enable = true;
      preferences = {
        "general.autoScroll" = true;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };
}
