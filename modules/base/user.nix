let
  userModule =
    { lib, ... }:
    {
      options.preferences = {
        user.name = lib.mkOption {
          type = lib.types.str;
          default = "alan";
        };
      };
    };
in
{
  flake.nixosModules.base = userModule;
  flake.darwinModules.base = userModule;
}
