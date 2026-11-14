{
  flake.darwinModules.homebrew = {
    homebrew = {
      enable = true;
      casks = [
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
