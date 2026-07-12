{ user, ... }:
{
  wsl = {
    enable = true;
    defaultUser = user;
    startMenuLaunchers = true;
  };
}
