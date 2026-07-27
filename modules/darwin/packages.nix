{
  flake.darwinModules.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        alacritty
        jetbrains.datagrip
        colima
        docker
        docker-compose
      ];
    };
}
