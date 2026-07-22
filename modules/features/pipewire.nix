{
  flake.nixosModules.pipewire = { ... }: {
    services.pipewire = {
      enable = true;
    };
  };
}
