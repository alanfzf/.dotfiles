{ inputs, ... }:
{
  flake.darwinModules.system = {

    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    system.defaults = {
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleShowScrollBars = "Always";
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        KeyRepeat = 1;
        InitialKeyRepeat = 15;
      };

      finder.AppleShowAllExtensions = true;

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.4;
        mru-spaces = false;
      };

      WindowManager.EnableStandardClickToShowDesktop = false;
      controlcenter.BatteryShowPercentage = true;
      screensaver.askForPasswordDelay = 10;
    };

    time.timeZone = "America/Guatemala";
  };
}
