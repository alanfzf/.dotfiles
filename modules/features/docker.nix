let
  darwinDocker = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      colima
      docker
      docker-compose
    ];
  };

  nixDocker = { ... }: {
    virtualisation.docker = {
      enable = true;
    };
  };
in
{
  flake.nixosModules.docker = nixDocker;
  flake.darwinModules.docker = darwinDocker;
}
