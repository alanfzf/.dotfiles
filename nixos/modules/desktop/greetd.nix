{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    my.greetd.command = lib.mkOption {
      type = lib.types.str;
      description = "Command started by greetd";
    };
  };

  config = {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          inherit user;
          command = config.my.greetd.command;
        };
      };
    };
  };
}
