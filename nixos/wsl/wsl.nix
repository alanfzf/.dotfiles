{ user, ... }:
{
  wsl = {
    enable = true;
    defaultUser = user;
  };

  wsl.usbip = {
    enable = true;
    autoAttach = [
      "2-9"
    ];
  };
}
