{ ... }:
{
  homebrew = {
    enable = true;
    casks = [ ];
    brews = [ ];
    masApps = { };
    onActivation = {
      cleanup = "zap";
    };
  };
}
