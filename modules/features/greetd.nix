{
  flake.nixosModules.greetd =
    { lib, config, ... }:
    let
      user = config.preferences.user.name;
    in
    {
      options = {
        preferences.greetd.command = lib.mkOption {
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
              command = config.preferences.greetd.command;
            };
          };
        };
      };
    };
}
