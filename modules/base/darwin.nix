{ inputs, lib, ... }:
{
  imports = [
    inputs.nix-darwin.flakeModules.default
  ];

  options.flake.darwinModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
    default = { };
    description = "Reusable nix-darwin modules";
  };
}
