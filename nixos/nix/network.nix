{
  networking.firewall.enable = false;
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };
  };
}
