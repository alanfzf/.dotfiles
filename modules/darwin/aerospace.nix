{
  flake.darwinModules.aerospace =
    { ... }:
    let
      aeroConfig = builtins.fromTOML (builtins.readFile ../../config/aerospace/aerospace.toml);
    in
    {
      services.aerospace = {
        enable = true;
        settings = aeroConfig;
      };
    };
}
