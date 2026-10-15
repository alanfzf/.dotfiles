let
  tailscaleModule = { ... }: {
    services.tailscale.enable = true;
  };
in
{
  flake.nixosModules.tailscale = tailscaleModule;
  flake.darwinModules.tailscale = tailscaleModule;
}
