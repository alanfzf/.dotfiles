{
  lib,
  config,
  pkgs,
  ...
}:
let
  isWSL = config.wsl.enable or false;
in
{
  config = lib.mkIf (!isWSL) {
    environment.localBinInPath = true;
    environment.systemPackages = with pkgs; [
      # below are optionals
      bruno
      obs-studio
      # android development
      android-studio
      android-tools
      # database
      jetbrains.datagrip
      rustdesk-flutter
    ];
  };
}
