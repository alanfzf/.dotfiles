{
  flake.darwinModules.users =
    { config, ... }:
    let
      user = config.preferences.user.name;
    in
    {
      users.users.${user}.home = "/Users/${user}";
      system.primaryUser = user;
    };
}
