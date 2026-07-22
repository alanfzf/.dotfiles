{
  flake.nixosModules.network = { ... }: {
    networking.nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    networking.firewall = {
      enable = false;
    };
    networking.networkmanager = {
      enable = true;
    };
  };
}
