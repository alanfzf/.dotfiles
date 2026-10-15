let
  androidStudio = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      android-studio
      android-tools
    ];
  };
in
{
  flake.darwinModules.android-studio = androidStudio;
  flake.nixosModules.android-studio = androidStudio;
}
