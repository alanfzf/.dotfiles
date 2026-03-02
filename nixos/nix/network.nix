{
  networking = {
    hostName = "nixos";
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    firewall = {
      enable = false;
    };
    networkmanager = {
      enable = true;
    };
  };
}
