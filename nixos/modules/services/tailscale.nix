{ lib, config, ... }:
{
  options = {
    my.vpn.enable = lib.mkEnableOption "Enable vpn configuration";
  };

  config = lib.mkIf config.my.vpn.enable {
    services.tailscale.enable = true;
  };
}
