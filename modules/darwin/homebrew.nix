{
  flake.darwinModules.homebrew = {
    homebrew = {
      enable = true;
      casks = [
        "spotify"
        "vlc"
      ];
      brews = [
      ];
      masApps = {
      };
      onActivation.cleanup = "zap";
    };
  };
}
