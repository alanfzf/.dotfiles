{ config, lib, ... }:
{
  options = {
    my.user = lib.mkOption {
      type = lib.types.str;
      description = "Name of the main mac system user";
    };
  };

  config = {
    users.users."${config.my.user}".home = "/Users/${config.my.user}";
    system.primaryUser = config.my.user;
  };
}
