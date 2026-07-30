{
  flake.darwinModules.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        firefox
        alacritty
        jetbrains.datagrip
        colima
        docker
        docker-compose
      ];
    };
}
