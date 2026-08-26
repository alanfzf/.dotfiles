{
  flake.nixosModules.gnome = { ... }: {
    services.gnome = {
      gnome-keyring.enable = true;
      gcr-ssh-agent.enable = false;
    };
  };
}
