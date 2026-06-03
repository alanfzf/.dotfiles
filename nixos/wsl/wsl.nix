{ user, ... }:
{
  wsl = {
    enable = true;
    defaultUser = user;
  };

  wsl.usbip = {
    enable = true;
    autoAttach = [ ];
  };
}
