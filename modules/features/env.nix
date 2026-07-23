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
        # android development
        android-studio
        android-tools
        # database
        jetbrains.datagrip
        rustdesk-flutter
      ];
    };
}
