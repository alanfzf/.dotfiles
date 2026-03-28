{ config, pkgs, ... }:
{
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [ ];
}
