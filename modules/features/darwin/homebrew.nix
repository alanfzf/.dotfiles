{
  flake.darwinModules.homebrew = {
    homebrew = {
      enable = true;
      casks = [
        "cloudmounter"
        "spotify"
        "vlc"
        "rustdesk"
        "onlyoffice"
      ];
      brews = [
      ];
      masApps = {
      };
      onActivation.cleanup = "zap";
    };
  };
}
