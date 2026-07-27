{ inputs, ... }:
{
  flake.darwinModules.system = {
    system.stateVersion = 5;
    system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

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
        KeyRepeat = 12;
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
