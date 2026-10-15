let
  darwinFirefox = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };

  nixFirefox = { ... }: {
    programs.firefox = {
      enable = true;
      preferences = {
        "general.autoScroll" = true;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };

in
{
  flake.nixosModules.firefox = nixFirefox;
  flake.darwinModules.firefox = darwinFirefox;
}
