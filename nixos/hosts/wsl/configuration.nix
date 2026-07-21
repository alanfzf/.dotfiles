{ inputs, ... }:
{
  imports = [
    ../../modules/wsl
  ];

  my.user = "alan";
  my.hostName = "wpc";
}
