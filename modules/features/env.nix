{
  flake.nixosModules.env =
    { pkgs, ... }:
    let
      app-launcher = pkgs.writeShellApplication {
        name = "app-launcher";
        runtimeInputs = with pkgs; [ ];
        excludeShellChecks = [ "SC2016" ];
        text = builtins.readFile ../../scripts/linux/launcher.sh;
      };
    in
    {
      environment.localBinInPath = true;
      environment.systemPackages = with pkgs; [
        app-launcher
        # below are optionals
        bruno
        obs-studio
        vlc
        onlyoffice-desktopeditors
        # database
        jetbrains.datagrip
        rustdesk-flutter
      ];
    };
}
