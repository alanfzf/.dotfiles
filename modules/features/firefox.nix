{
  flake.nixosModules.firefox = { ... }: {
    programs.firefox = {
      enable = true;
      preferences = {
        "general.autoScroll" = true;
      };
    };
  };
}
