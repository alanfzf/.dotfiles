{
  flake.darwinModules.env =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        alacritty
        jetbrains.datagrip
      ];
    };
}
