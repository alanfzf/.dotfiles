{
  config,
  pkgs,
  user,
  ...
}:
{
  virtualisation.docker = {
    enable = true;
  };
}
