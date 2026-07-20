{ ... }:
{
  programs.firefox = {
    enable = true;
    preferences = {
      "general.autoScroll" = true;
    };
  };
}
